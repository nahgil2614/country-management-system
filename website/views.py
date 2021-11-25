from flask import Blueprint, render_template, request, flash, jsonify, redirect, url_for
from flask_login import login_required, current_user
from . import db, cursor, dbmysql
import json
import random

views = Blueprint('views', __name__)

@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    return render_template("home.html", user=current_user)


@views.route('/register', methods=['GET', 'POST'])
@login_required
def register():
    if request.method == 'POST':
        current_user.oldEType = current_user.eType
        current_user.eType = request.form.get('entityType')
        form = request.form.to_dict(flat=True)
        if current_user.eType:
            if current_user.eType == 'choose':
                flash('Please choose one entity type', category='error')
                return render_template("register.html", user=current_user)
            else:
                cursor.execute('show columns from ' + current_user.eType.replace(' ','_'))
                current_user.to_insert = [col[0] for col in cursor.fetchall()]
                current_user.cols = [col for col in current_user.to_insert if 'ID' not in col and col not in ['SBName', 'MOFName', 'MOEName', 'MOHName', 'MOTName']]
                return render_template("register.html", user=current_user)
        elif form:
            if any([v == '' for v in form.values()]):
                flash('Please fill in all the requested information', category='error')
                return render_template("register.html", user=current_user)
            
            values = []
            for col in current_user.to_insert:
                if col in form:
                    values.append(form[col])
                elif 'ID' in col:
                    values.append(random.randint(0,999999))
                elif col == 'SBName':
                    values.append('Statebank')
                elif col == 'MOFName':
                    values.append('Finance')
                elif col == 'MOEName':
                    values.append('Education')
                elif col == 'MOHName':
                    values.append('Health')
                elif col == 'MOTName':
                    values.append('Trade')

            try:
                cursor.execute('insert into ' + current_user.oldEType.replace(' ','_') + ' values ' + str(tuple(values)))
            except: # referential integrity, type in text in numerical field, etc.
                flash('Oops! There are some errors. Please try again.', category='error')
                return render_template("register.html", user=current_user)
            dbmysql.commit()
            flash('Registered successfully!', category='success')
            return redirect(url_for('views.home'))

    return render_template("register.html", user=current_user)

@views.route('/report', methods=['GET', 'POST'])
@login_required
def report():
    if request.method == 'POST':
        eType = request.form.get('entityType')
        summarized = request.form.getlist('summarized')
        if eType:
            if eType == 'choose':
                flash('Please choose one entity type', category='error')
                render_template("report.html", user=current_user, eType=None)
            else:
                if summarized:
                    header = ['BankID' if eType == 'bank' else 'ID', 'Name']
                else:
                    cursor.execute('show columns from ' + eType.replace(' ','_'))
                    header = [col[0] for col in cursor.fetchall()]
                cursor.execute("select " + (('BankID' if eType == 'bank' else 'ID') + ", Name" if summarized else "*") + " from " + eType.replace(' ','_'))
                rows = cursor.fetchall()
                rows = [[row[0], row[1:]] for row in rows]
                return render_template("report.html", user=current_user, eType=eType, header=header, rows=rows, type='Summarized' if summarized else 'Regular')

    return render_template("report.html", user=current_user, eType=None)


@views.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == 'POST':
        eType = request.form.get('entityType')
        name = request.form.get('name')
        relative = request.form.getlist('relative')
        if eType == 'all':
            eTypes = ['bank', 'university', 'school', 'library', 'central hospital', 'provincial hospital', 'local hospital', 'market', 'online shop']
        else:
            eTypes = [eType]

        headers = []
        rowss = []
        for eType in eTypes:
            cursor.execute('show columns from ' + eType.replace(' ','_'))
            headers.append([col[0] for col in cursor.fetchall()])
            if relative:
                cursor.execute("select * from " + eType.replace(' ','_') + " where Name like '%" + name + "%'")
            else:
                 cursor.execute("select * from " + eType.replace(' ','_') + " where Name = '" + name + "'")
            rows = cursor.fetchall()
            rowss.append([[row[0], row[1:]] for row in rows])

        info = zip(eTypes, headers, rowss)
        info = [(eType, header, rows) for eType, header, rows in info if rows]
        info = [(i+1, *info[i]) for i in range(len(info))]
        return render_template("search.html", user=current_user, name=name, info=info, eTypes=eTypes, relative=relative)

    return render_template("search.html", user=current_user, info=None)