from flask import Blueprint, render_template, request, flash, jsonify, redirect, url_for
from flask_login import login_required, current_user
from . import db, cursor, dbmysql
import json
import random
from . import user_info

views = Blueprint('views', __name__)

@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    try:
        user_info[current_user.id]['eType'] = ''
    except:
        pass
    return render_template("home.html", user=current_user)

@views.route('/register', methods=['GET', 'POST'])
@login_required
def register():
    if request.method == 'POST':
        user_info[current_user.id]['oldEType'] = user_info[current_user.id]['eType']
        user_info[current_user.id]['eType'] = request.form.get('entityType')
        form = request.form.to_dict(flat=True)
        if user_info[current_user.id]['eType']:
            if user_info[current_user.id]['eType'] == 'choose':
                flash('Please choose one entity type', category='error')
                return render_template("register.html", user=current_user, eType=user_info[current_user.id]['eType'], cols=user_info[current_user.id]['cols'])
            else:
                cursor.execute('show columns from ' + user_info[current_user.id]['eType'].replace(' ','_'))
                user_info[current_user.id]['to_insert'] = [col[0] for col in cursor.fetchall()]
                user_info[current_user.id]['cols'] = [col for col in user_info[current_user.id]['to_insert'] if 'ID' not in col and col not in ['SBName', 'MOFName', 'MOEName', 'MOHName', 'MOTName']]
                return render_template("register.html", user=current_user, eType=user_info[current_user.id]['eType'], cols=user_info[current_user.id]['cols'])
        elif form:
            if any([v == '' for v in form.values()]):
                flash('Please fill in all the requested information', category='error')
                return render_template("register.html", user=current_user, eType=user_info[current_user.id]['eType'], cols=user_info[current_user.id]['cols'])

            values = []
            for col in user_info[current_user.id]['to_insert']:
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
                cursor.execute('insert into ' + user_info[current_user.id]['oldEType'].replace(' ','_') + ' values ' + str(tuple(values)))
            except: # referential integrity, type in text in numerical field, etc.
                import traceback
                traceback.print_exc()
                flash('Oops! There are some errors. Please try again.', category='error')
                return render_template("register.html", user=current_user)
            dbmysql.commit()
            flash('Registered successfully!', category='success')
            return redirect(url_for('views.home'))

    return render_template("register.html", user=current_user, eType=user_info[current_user.id]['eType'], cols=user_info[current_user.id]['cols'])

@views.route('/report', methods=['GET', 'POST'])
@login_required
def report():
    try:
        user_info[current_user.id]['eType'] = ''
    except:
        pass
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
    try:
        user_info[current_user.id]['eType'] = ''
    except:
        pass
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