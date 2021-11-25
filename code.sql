CREATE TABLE POLICY_SB(
    Name VARCHAR(20),
    Policy VARCHAR(100),
    PRIMARY KEY(Name, Policy)
);

CREATE TABLE PUBLICATION_SB(
    Name VARCHAR(20),
    Publication VARCHAR(100),
    PRIMARY KEY(Name, Publication)
);

CREATE TABLE POLICY_FINANCE(
    Name VARCHAR(20),
    Policy VARCHAR(100),
    PRIMARY KEY(Name, Policy)
);

CREATE TABLE PUBLICATION_FINANCE(
    Name VARCHAR(20),
    Publication VARCHAR(100),
    PRIMARY KEY(Name, Publication)
);

CREATE TABLE POLICY_EDUCATION(
    Name VARCHAR(20),
    Policy VARCHAR(100),
    PRIMARY KEY(Name, Policy)
);

CREATE TABLE PUBLICATION_EDUCATION(
    Name VARCHAR(20),
    Publication VARCHAR(100),
    PRIMARY KEY(Name, Publication)
);

CREATE TABLE POLICY_HEALTH(
    Name VARCHAR(20),
    Policy VARCHAR(100),
    PRIMARY KEY(Name, Policy)
);

CREATE TABLE PUBLICATION_HEALTH(
    Name VARCHAR(20),
    Publication VARCHAR(100),
    PRIMARY KEY(Name, Publication)
);

CREATE TABLE POLICY_TRADE(
    Name VARCHAR(20),
    Policy VARCHAR(100),
    PRIMARY KEY(Name, Policy)
);

CREATE TABLE PUBLICATION_TRADE(
    Name VARCHAR(20),
    Publication VARCHAR(100),
    PRIMARY KEY(Name, Publication)
);

CREATE TABLE EDU_RESEARCH(
    Name VARCHAR(20),
    SciResearch VARCHAR(100),
    PRIMARY KEY(Name, SciResearch)
);

CREATE TABLE HEALTH_RESEARCH(
    Name VARCHAR(20),
    SciResearch VARCHAR(100),
    PRIMARY KEY(Name, SciResearch)
);

CREATE TABLE VACCINATION_PROGRAM(
    Name VARCHAR(20),
    Program VARCHAR(100),
    PRIMARY KEY(Name, Program)
);

CREATE TABLE BANK_PROGRAM(
    BankID INT,
    Program VARCHAR(100),
    PRIMARY KEY(BankID, Program)
);

CREATE TABLE BANK(
    BankID INT PRIMARY KEY,
    Name VARCHAR(20),
    BalanceSheet INT,
    Director VARCHAR(20),
    SBName VARCHAR(20),
    MOFName VARCHAR(20),
    UNIQUE(Name)
);

CREATE TABLE INFORMATION_EXCHANGE(
    BankID INT,
    CoopBankID INT,
    BadCreditAccountNo INT,
    PRIMARY KEY(BankID, CoopBankID, BadCreditAccountNo)
);

CREATE TABLE STATEBANK(
    Name VARCHAR(20) PRIMARY KEY CHECK (Name='Statebank'),
    Minister VARCHAR(20),
    Budget INT,
    Function VARCHAR(100),
    TotalLiquidity INT,
    MoneyInCirculation INT
);

CREATE TABLE MINISTRY_OF_FINANCE(
    Name VARCHAR(20) PRIMARY KEY CHECK (Name='Finance'),
    Minister VARCHAR(20),
    Budget INT,
    Function VARCHAR(100),
    StateBudget INT,
    PublicAssets INT
);

CREATE TABLE MINISTRY_OF_EDUCATION(
    Name VARCHAR(20) PRIMARY KEY CHECK (Name='Education'),
    Minister VARCHAR(20),
    Budget INT,
    Function VARCHAR(100)
);

CREATE TABLE MINISTRY_OF_HEALTH(
    Name VARCHAR(20) PRIMARY KEY CHECK (Name='Health'),
    Minister VARCHAR(20),
    Budget INT,
    Function VARCHAR(100)
);

CREATE TABLE MINISTRY_OF_TRADE(
    Name VARCHAR(20) PRIMARY KEY CHECK (Name='Trade'),
    Minister VARCHAR(20),
    Budget INT,
    Function VARCHAR(100)
);

CREATE TABLE DEPARTMENT_OF_FINANCE(
    ProvinceName VARCHAR(20) PRIMARY KEY,
    Head VARCHAR(20),
    MOFName VARCHAR(20)
);

CREATE TABLE DEPARTMENT_OF_EDUCATION(
    ProvinceName VARCHAR(20) PRIMARY KEY,
    Head VARCHAR(20),
    MOEName VARCHAR(20)
);

CREATE TABLE DEPARTMENT_OF_HEALTH(
    ProvinceName VARCHAR(20) PRIMARY KEY,
    Head VARCHAR(20),
    MOHName VARCHAR(20)
);

CREATE TABLE DEPARTMENT_OF_TRADE(
    ProvinceName VARCHAR(20) PRIMARY KEY,
    Head VARCHAR(20),
    MOTName VARCHAR(20)
);

CREATE TABLE UNIVERSITY(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Address VARCHAR(100),
    Principal VARCHAR(20),
    MOEName VARCHAR(20),
    UNIQUE(Name),
    UNIQUE(Address)
);

CREATE TABLE CENTRAL_HOSPITAL(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Address VARCHAR(100),
    NoDoctors INT,
    NoEquipment INT,
    MOHName VARCHAR(20),
    UNIQUE(Name),
    UNIQUE(Address)
);

CREATE TABLE BILATERAL_TRADE(
    ID INT PRIMARY KEY,
    Country VARCHAR(20),
    Goods VARCHAR(20),
    Year INT,
    Quantity INT,
    isImport BOOLEAN,
    MOTName VARCHAR(20)
);

CREATE TABLE ONLINE_SHOP(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Owner VARCHAR(20),
    URL VARCHAR(80),
    MOTName VARCHAR(20),
    UNIQUE(Name),
    UNIQUE(URL)
);

CREATE TABLE DIVISION_OF_FINANCE(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Head VARCHAR(20),
    PRIMARY KEY(ProvinceName, DistrictName)
);

CREATE TABLE DIVISION_OF_EDUCATION(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Head VARCHAR(20),
    PRIMARY KEY(ProvinceName, DistrictName)
);

CREATE TABLE DIVISION_OF_HEALTH(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Head VARCHAR(20),
    PRIMARY KEY(ProvinceName, DistrictName)
);

CREATE TABLE DIVISION_OF_TRADE(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Head VARCHAR(20),
    PRIMARY KEY(ProvinceName, DistrictName)
);

CREATE TABLE BANK_BRANCH(
    BankID INT,
    BranchID INT,
    Name VARCHAR(20),
    Manager VARCHAR(20),
    Address VARCHAR(100),
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    PRIMARY KEY(BankID, BranchID),
    UNIQUE(Name),
    UNIQUE(Address)
);

CREATE TABLE PROVINCIAL_HOSPITAL(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Address VARCHAR(100),
    NoDoctors INT,
    NoEquipment INT,
    ProvinceName VARCHAR(20),
    UNIQUE(Address)
);

CREATE TABLE SCHOOL(
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Principal VARCHAR(20),
    Address VARCHAR(100),
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    UNIQUE(Address)
);

CREATE TABLE LIBRARY(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Librarian VARCHAR(20),
    NoBooks INT,
    Address VARCHAR(100),
    ProvinceName VARCHAR(20),
    UNIQUE(Address)
);

CREATE TABLE LOCAL_HOSPITAL(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Address VARCHAR(100),
    NoDoctors INT,
    NoEquipment INT,
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    UNIQUE(Address)
);

CREATE TABLE VACCINATION_INFO(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    ManagerName VARCHAR(20),
    NoOfVaccinated INT,
    NoOfUnvaccinated INT,
    PRIMARY KEY(ProvinceName, DistrictName)
);

CREATE TABLE MARKET(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Manager VARCHAR(20),
    Type VARCHAR(20),
    NoOfKiosk INT,
    Address VARCHAR(100),
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    UNIQUE(Address)
);

CREATE TABLE RED_ZONE(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Zone VARCHAR(40),
    PRIMARY KEY(ProvinceName, DistrictName, Zone)
);

CREATE TABLE GREEN_ZONE(
    ProvinceName VARCHAR(20),
    DistrictName VARCHAR(20),
    Zone VARCHAR(40),
    PRIMARY KEY(ProvinceName, DistrictName, Zone)
);

CREATE TABLE OS_GOODS(
    OS_ID INT,
    Goods VARCHAR(20),
    PRIMARY KEY(OS_ID, Goods)
);

ALTER TABLE POLICY_SB
ADD FOREIGN KEY(Name)
REFERENCES STATEBANK(Name)
ON DELETE CASCADE;

ALTER TABLE PUBLICATION_SB
ADD FOREIGN KEY(Name)
REFERENCES STATEBANK(Name)
ON DELETE CASCADE;

ALTER TABLE POLICY_FINANCE
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_FINANCE(Name)
ON DELETE CASCADE;

ALTER TABLE PUBLICATION_FINANCE
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_FINANCE(Name)
ON DELETE CASCADE;

ALTER TABLE POLICY_EDUCATION
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_EDUCATION(Name)
ON DELETE CASCADE;

ALTER TABLE PUBLICATION_EDUCATION
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_EDUCATION(Name)
ON DELETE CASCADE;

ALTER TABLE POLICY_HEALTH
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE PUBLICATION_HEALTH
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE POLICY_TRADE
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_TRADE(Name)
ON DELETE CASCADE;

ALTER TABLE PUBLICATION_TRADE
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_TRADE(Name)
ON DELETE CASCADE;

ALTER TABLE EDU_RESEARCH
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_EDUCATION(Name)
ON DELETE CASCADE;

ALTER TABLE HEALTH_RESEARCH
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE VACCINATION_PROGRAM
ADD FOREIGN KEY(Name)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE BANK_PROGRAM
ADD FOREIGN KEY (BankID)
REFERENCES BANK(BankID)
ON DELETE CASCADE;

ALTER TABLE BANK
ADD FOREIGN KEY(SBName)
REFERENCES STATEBANK(Name)
ON DELETE CASCADE;

ALTER TABLE BANK
ADD FOREIGN KEY(MOFName)
REFERENCES MINISTRY_OF_FINANCE(Name)
ON DELETE CASCADE;

ALTER TABLE INFORMATION_EXCHANGE
ADD FOREIGN KEY(BankID)
REFERENCES BANK(BankID)
ON DELETE CASCADE;

ALTER TABLE INFORMATION_EXCHANGE
ADD FOREIGN KEY(CoopBankID)
REFERENCES BANK(BankID)
ON DELETE CASCADE;

ALTER TABLE DEPARTMENT_OF_FINANCE
ADD FOREIGN KEY(MOFName)
REFERENCES MINISTRY_OF_FINANCE(Name)
ON DELETE CASCADE;

ALTER TABLE DEPARTMENT_OF_EDUCATION
ADD FOREIGN KEY(MOEName)
REFERENCES MINISTRY_OF_EDUCATION(Name)
ON DELETE CASCADE;

ALTER TABLE DEPARTMENT_OF_HEALTH
ADD FOREIGN KEY(MOHName)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE DEPARTMENT_OF_TRADE
ADD FOREIGN KEY(MOTName)
REFERENCES MINISTRY_OF_TRADE(Name)
ON DELETE CASCADE;

ALTER TABLE UNIVERSITY
ADD FOREIGN KEY(MOEName)
REFERENCES MINISTRY_OF_EDUCATION(Name)
ON DELETE CASCADE;

ALTER TABLE CENTRAL_HOSPITAL
ADD FOREIGN KEY(MOHName)
REFERENCES MINISTRY_OF_HEALTH(Name)
ON DELETE CASCADE;

ALTER TABLE BILATERAL_TRADE
ADD FOREIGN KEY(MOTName)
REFERENCES MINISTRY_OF_TRADE(Name)
ON DELETE CASCADE;

ALTER TABLE ONLINE_SHOP
ADD FOREIGN KEY(MOTName)
REFERENCES MINISTRY_OF_TRADE(Name)
ON DELETE CASCADE;

ALTER TABLE DIVISION_OF_FINANCE
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_FINANCE(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE DIVISION_OF_EDUCATION
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_EDUCATION(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE DIVISION_OF_HEALTH
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_HEALTH(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE DIVISION_OF_TRADE
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_TRADE(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE BANK_BRANCH
ADD FOREIGN KEY(BankID)
REFERENCES BANK(BankID)
ON DELETE CASCADE;

ALTER TABLE BANK_BRANCH
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES DIVISION_OF_FINANCE(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE PROVINCIAL_HOSPITAL
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_HEALTH(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE SCHOOL
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES DIVISION_OF_EDUCATION(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE LIBRARY
ADD FOREIGN KEY(ProvinceName)
REFERENCES DEPARTMENT_OF_EDUCATION(ProvinceName)
ON DELETE CASCADE;

ALTER TABLE LOCAL_HOSPITAL
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES DIVISION_OF_HEALTH(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE VACCINATION_INFO
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES DIVISION_OF_HEALTH(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE MARKET
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES DIVISION_OF_TRADE(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE RED_ZONE
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES VACCINATION_INFO(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE GREEN_ZONE
ADD FOREIGN KEY(ProvinceName, DistrictName)
REFERENCES VACCINATION_INFO(ProvinceName, DistrictName)
ON DELETE CASCADE;

ALTER TABLE OS_GOODS
ADD FOREIGN KEY(OS_ID)
REFERENCES ONLINE_SHOP(ID)
ON DELETE CASCADE;

-- ====================== INSERT ==================

INSERT INTO STATEBANK
VALUES('Statebank', 'Ly Quoc Thai', 14000000, 'Managing banks', 1000000,2000000);

INSERT INTO MINISTRY_OF_FINANCE
VALUES('Finance', 'Nguyen Ngoc Mai', 15000000, 'Managing banks and departments of finance', 5000000, 3000000);

INSERT INTO MINISTRY_OF_EDUCATION
VALUES('Education', 'Nguyen Tan Phu', 12000000, 'Managing universities and departments of education');

INSERT INTO MINISTRY_OF_HEALTH
VALUES('Health', 'Le Minh Thuan', 18000000, 'Managing central hospitals and departments of health');

INSERT INTO MINISTRY_OF_TRADE
VALUES('Trade', 'Nguyen Ngoc Nam', 17000000, 'Managing bilateral trade, departments and online shops');

INSERT INTO POLICY_SB
VALUES
('Statebank', 'Ensuring safe and sound banking operations and the system of credit institutions'),
('Statebank', 'Ensuring safe and efficiency of national payment system');

INSERT INTO PUBLICATION_SB
VALUES
('Statebank', 'The way to reach annual inflation rate targets'),
('Statebank', 'National reports ');

INSERT INTO POLICY_FINANCE
VALUES
('Finance', 'Strengthen relations with counterparts'),
('Finance', 'Create mutually beneficial partnerships');

INSERT INTO PUBLICATION_FINANCE
VALUES
('Finance', 'National reports'),
('Finance', 'Socio-economic development in 2014');

INSERT INTO POLICY_EDUCATION
VALUES
('Education', 'Higher Education curriculum to possess Flexibility of Subjects'),
('Education', 'Fixed fees for public and private institutions');

INSERT INTO PUBLICATION_EDUCATION
VALUES
('Education', 'National reports'),
('Education', 'The Information and Communications going along with Education and Training');

INSERT INTO POLICY_HEALTH
VALUES
('Health', 'Allow registered pharmacists to be Pharmacist Investigators (PIs) of clinical trials'),
('Health', 'Perform Collaborative Prescribing Services');

INSERT INTO PUBLICATION_HEALTH
VALUES
('Health', 'National reports'),
('Health', 'NURSING PRACTICE GUIDELINES');

INSERT INTO POLICY_TRADE
VALUES
('Trade', 'Restricts the import and sale of non-medicinal chewing gum'),
('Trade', 'Maintain liberal trading regimes');

INSERT INTO PUBLICATION_TRADE
VALUES
('Trade', 'National reports'),
('Trade', 'Country Commercial Guide');

INSERT INTO EDU_RESEARCH
VALUES
('Education', 'How does the blended learning approach affect students performance?'),
('Education', 'The trends in computer literacy'),
('Education', 'From homeschooling to successful careers: an overview'),
('Education', 'How do children benefit from bilingual education?'),
('Education', 'How can career counseling support high school students?');

INSERT INTO HEALTH_RESEARCH
VALUES
('Health', 'A closer look at the most dangerous diseases in the 21st'),
('Health', 'What role do therapists play in the treatment of the mental disorder?'),
('Health', 'Sleep deprivation: A closer look at its implications on memory.'),
('Health', 'A closer look at alternative medication: Does it work?'),
('Health', 'COVID-19 vaccination: What is driving the fear in people about it?');

INSERT INTO VACCINATION_PROGRAM
VALUES
('Health', 'Adult vaccination'),
('Health', 'National vaccination'),
('Health', 'Astra vaccination');

INSERT INTO BANK
VALUES
(1, 'BID', 4500000, 'John Cena', 'Statebank', 'Finance'),
(2, 'FTB', 6000000, 'Henry Ford', 'Statebank', 'Finance'),
(3, 'CJSBank', 6800000, 'Henry Kissinger', 'Statebank', 'Finance'),
(4, 'ABank', 5200000, 'David Pawson', 'Statebank', 'Finance');

INSERT INTO BANK_PROGRAM
VALUES
(1, 'SPECIAL OFFER FOR NEW INTERNATIONAL DEBIT CARDHOLDERS'),
(2, 'Key selling points of FWD Elevating success'),
(3, 'Priority Savings'),
(2, 'Visa Signature international credit card'),
(4, 'Portfolio Management');

INSERT INTO INFORMATION_EXCHANGE
VALUES
(1, 2, 00014586),
(2, 1, 00014586),
(2, 3, 0008642),
(3, 2, 0008642),
(1, 4, 12300089),
(4, 1, 12300089);

INSERT INTO DEPARTMENT_OF_FINANCE
VALUES
('Dong Nai', 'Truong Thi Kim Hue', 'Finance'),
('Binh Thuan', 'Mai Xuan Ba', 'Finance'),
('HCMC', 'Nguyen Van Hieu', 'Finance'),
('Binh Dinh', 'Nguyen Tan Loc', 'Finance');

INSERT INTO DEPARTMENT_OF_EDUCATION
VALUES
('Dong Nai', 'Phan Huy Anh Vu', 'Education'),
('Binh Thuan', 'Nguyen Hoang Minh', 'Education'),
('HCMC', 'Tang Chi Thuong', 'Education'),
('Binh Dinh', 'Le Viet Hung', 'Education');

INSERT INTO DEPARTMENT_OF_HEALTH
VALUES
('Dong Nai', 'Nguyen Tan Binh', 'Health'),
('Binh Thuan', 'Pham Manh Hung', 'Health'),
('HCMC', 'Le Viet Duc', 'Health'),
('Binh Dinh', 'Le Tan Loc', 'Health');

INSERT INTO CENTRAL_HOSPITAL
VALUES
(1, 'Tu Du Hospital', '284 Cong Quynh, District 1, HCMC, VietNam', 200, 5000, 'Health'),
(2, 'M.U Hospital', '215 Hong Bang, Ward 11, District 5, HCMC', 300, 5800, 'Health'),
(3, 'Heart hospital', '04 Duong Quang Trung street, district 10, HCMC', 150, 3200, 'Health'),
(4, 'Cho Ray hospital', '201B Nguyen Chi Thanh, district 5, HCMC', 230, 3600, 'Health');

INSERT INTO PROVINCIAL_HOSPITAL
VALUES
(1, 'Dong Nai hospital', '2 Dong Khoi street, Tan Hiep, Bien Hoa City, Dong Nai', 120, 1800, 'Dong Nai'),
(2, 'Binh Thuan hospital', '14 Truong Chinh, Phu Tai, Phan Thiet City, Binh Thuan', 140, 2000, 'Binh Thuan'),
(3, 'Hoa Hao hospital', '3 Le Cong Dinh, Phan Thiet, Binh Thuan', 128, 1950, 'Binh Thuan'),
(4, 'Quy Nhon hospital', '114 Tran Hung Dao, Hai Cang, Quy Nhon City, Binh Dinh', 100, 1500, 'Binh Dinh');

INSERT BILATERAL_TRADE
VALUES
(1, 'Korea', 'Seaweed', 2018, 5000, True, 'Trade'),
(2, 'South Africa', 'Cocoa', 2019, 6000, True, 'Trade'),
(3, 'France', 'Coffee', 2019, 8000, False, 'Trade'),
(4, 'UK', 'Tea', 2020, 7000, False, 'Trade'),
(5, 'China', 'Mango', 2020, 6500, False, 'Trade'),
(6, 'Germany', 'Car', 2021, 800, True, 'Trade');

INSERT DEPARTMENT_OF_TRADE
VALUES
('Dong Nai', 'Pham Minh Hoang', 'Trade'),
('Binh Thuan', 'Le Viet Hung', 'Trade'),
('Binh Dinh', 'Nguyen The Minh', 'Trade'),
('HCMC', 'Le The Loc', 'Trade');

INSERT INTO DIVISION_OF_FINANCE
VALUES
('Dong Nai', 'Long Khanh', 'Nguyen Van Hieu'),
('Binh Thuan', 'Ham Tan', 'Le Nhat Tan'),
('HCMC', 'District 10', 'Le Van Tam'),
('Binh Dinh', 'Phu Cat', 'Nguyen Ba Hung'),
('HCMC', 'District 1','Nguyen Nhat Quang');

INSERT INTO BANK_BRANCH
VALUES
(2, 1, 'FTB CMT8', 'Le Viet Hoang', '268 Cach mang Thang Tam, Long Khanh, Dong Nai', 'Dong Nai', 'Long Khanh'),
(1, 2, 'BID Saigon 1', 'Le Nhat Tan', '276 Ly Thuong Kiet, District 1, HCMC', 'HCMC', 'District 1'),
(3, 3, 'CJSB District 10', 'Nguyen Ngoc Nhan', '12 Hoa Hao, District 10, HCMC', 'HCMC', 'District 10'),
(4, 4, 'ABank Ham Tan', 'Vo Huy Hoang', '14 Thong Nhat, Ham Tan, Binh Thuan', 'Binh Thuan', 'Ham Tan'),
(2, 5, 'FTB Hoai Nhon', 'Ngo Tat To', '42 Vo Nguyen Giap, Phu Cat, Binh Dinh', 'Binh Dinh', 'Phu Cat');

INSERT INTO DIVISION_OF_EDUCATION
VALUES
('Dong Nai', 'Long Khanh', 'Nguyen Nhat Long'),
('Binh Thuan', 'Ham Tan', 'Le Hoang Viet'),
('HCMC', 'District 10', 'Nguyen Thai Hoc'),
('Binh Dinh', 'Phu Cat', 'Pham Minh Chinh'),
('HCMC', 'District 1', 'Le Tan Loc');

INSERT INTO SCHOOL
VALUES
(1, 'Ngo Quyen high school', 'Pham Minh Chinh', '210 CMT8, Long Khanh, Dong Nai', 'Dong Nai', 'Long Khanh'),
(2, 'Tran Hung Dao high school', 'Le Cong Minh', '224 Ly Thai To, Ham Tan, Binh Thuan', 'Binh Thuan', 'Ham Tan'),
(3, 'Nguyen Khuyen high school', 'Le Quang Dinh', '246 Nguyen Thi Minh Khai, District 10, HCMC', 'HCMC', 'District 10'),
(4, 'Le Quy Don high school', 'Pham Tan Phuoc', '249 Ngo Quyen, Phu Cat, Binh Dinh', 'Binh Dinh', 'Phu Cat'),
(5, 'Mac Dinh Chi high school', 'Le Tan Tai', '278 Ngo Quyen, District 1, HCMC', 'HCMC', 'District 1'),
(6, 'Hung Vuong high school', 'Nguyen Ngoc Duyen', '478 Hung Vuong, District 1, HCMC', 'HCMC', 'District 1');

INSERT INTO LIBRARY
VALUES
(1, 'Library of Dong Nai', 'Nguyen Ngoc Ha', 6000, '21 Dinh Bo Linh, Bien Hoa City, Dong Nai', 'Dong Nai'),
(2, 'Central library', 'Nguyen Thai Hoa', 6500, '38 Ly Thai To, Phan Thiet City, Binh Thuan', 'Binh Thuan'),
(3, 'Saigon Library', 'Pham Dinh Thai', 7000, '24 Nguyen Thi Minh Khai, District 10, HCMC', 'HCMC'),
(4, 'Phuong Nam Library', 'Ho Viet Toan', 6400, '32 Le Cong Dinh, District 1, HCMC', 'HCMC'),
(5, 'Ocean Library', 'Nguyen Huyen Trang', 6800, '48 Nguyen Hue, Quy Nhon City, Binh Dinh', 'Binh Dinh');

INSERT INTO DIVISION_OF_HEALTH
VALUES
('Dong Nai', 'Long Khanh', 'Le Viet Minh'),
('Binh Thuan', 'Ham Tan', 'Nguyen Hoang Loc'),
('HCMC', 'District 10', 'Pham Tan Loc'),
('Binh Dinh', 'Phu Cat', 'Vo Tan Minh'),
('HCMC', 'District 1', 'Nguyen Hoang Dung'),
('Binh Thuan', 'Phan Thiet', 'Nguyen Hoang Tan');

INSERT INTO LOCAL_HOSPITAL
VALUES
(1, 'Long Khanh hospital', '21 Le Quang Dinh, Long Khanh, Dong Nai', 35, 300, 'Dong Nai', 'Long Khanh'),
(2, 'Ham Tan hospital', '35 Ngo Quyen, Ham Tan, Binh Thuan', 40, 400, 'Binh Thuan', 'Ham Tan'),
(3, 'District 10 hospital', '36 Nguyen Thi Minh Khai, District 10, HCMC', 28, 350, 'HCMC', 'District 10'),
(4, 'Phu Cat hospital', '47 Tran Hung Dao, Phu Cat, Binh Dinh', 50, 320, 'Binh Dinh', 'Phu Cat'),
(5, 'District 1 hospital', '67 Ly Thuong Kiet, District 1, HCMC', 38, 35, 'HCMC', 'District 1');

INSERT INTO VACCINATION_INFO
VALUES
('Dong Nai', 'Long Khanh', 'Le Nhat Tan', 158700, 30000),
('Binh Thuan', 'Ham Tan', 'Nguyen Viet Tuan', 210000, 20000),
('HCMC', 'District 10', 'Nguyen Ngoc Hung', 230000, 18000),
('Binh Dinh', 'Phu Cat', 'Pham The Loc', 225000, 19800),
('HCMC', 'District 1', 'Nguyen The Ha', 230000, 6500);

INSERT INTO RED_ZONE
VALUES
('Dong Nai', 'Long Khanh', 'Binh Tan Ward'),
('Dong Nai', 'Long Khanh', 'Long Binh Ward'),
('Binh Thuan', 'Ham Tan', 'Ham Thuan Ward'),
('HCMC', 'District 10', 'Ward 3'),
('Binh Dinh', 'Phu Cat', 'Phu My Ward'),
('HCMC', 'District 1', 'Ward 1'),
('HCMC', 'District 1', 'Ward 3');

INSERT INTO GREEN_ZONE
VALUES
('Dong Nai', 'Long Khanh', 'Tan Mai Ward'),
('Dong Nai', 'Long Khanh', 'Long Thanh Ward'),
('Dong Nai', 'Long Khanh', 'Thong Nhat Ward'),
('Binh Thuan', 'Ham Tan', 'Thanh Binh Ward'),
('Binh Thuan', 'Ham Tan', 'Tan Tien Ward'),
('HCMC', 'District 10', 'Ward 1'),
('HCMC', 'District 10', 'Ward 2'),
('Binh Dinh', 'Phu Cat', 'Thai Hoa Ward'),
('Binh Dinh', 'Phu Cat', 'Thai Binh Ward'),
('HCMC', 'District 1', 'Ward 2');

INSERT INTO DIVISION_OF_TRADE
VALUES
('Dong Nai', 'Long Khanh', 'Nguyen Tan Loc'),
('Binh Thuan', 'Ham Tan', 'Le Thanh Hai'),
('HCMC', 'District 10', 'Nguyen Phuoc Thinh'),
('Binh Dinh', 'Phu Cat', 'Nguyen Ngoc Hoa'),
('HCMC', 'District 1', 'Le Minh Dinh');

INSERT INTO MARKET
VALUES
(1, 'Binh Tan Market', 'Le Ngoc Hoa', 'Local market', 60, '46 Thong Nhat, Long Khanh, Dong Nai', 'Dong Nai', 'Long Khanh'),
(2, 'Coopmart Ham Tan', 'Pham Dinh Phuoc', 'Supermarket', 200, '78 CMT8, Ham Tan, Binh Thuan', 'Binh Thuan', 'Ham Tan'),
(3, 'BigC Ly Thuong Kiet', 'Pham Hoa Hao', 'Supermarket', 180, '42 Ly Thuong Kiet, District 10, HCMC', 'HCMC', 'District 10'),
(4, 'Phu Cat Market', 'Le The Ha', 'Local market', 78, '86 Tran Hung Dao, Phu Cat, Binh Dinh', 'Binh Dinh', 'Phu Cat'),
(5, 'BigC NTMK', 'Nguyen Dinh Hao', 'Supermarket', 210, '46 Nguyen Thi Minh Khai, District 1, HCMC', 'HCMC', 'District 1');

INSERT INTO ONLINE_SHOP
VALUES
(1, 'Mommy Baby shop', 'Le Thanh Danh', 'MBaby.com', 'Trade'),
(2, 'ToTo shop', 'Nguyen Ngoc Dat', 'ToTo.com', 'Trade'),
(3, 'TTC shop', 'Le Minh Phuc', 'TTC.com', 'Trade'),
(4, 'Meichan shop', 'Nguyen Hoang Ngoc', 'Meichan.com', 'Trade'),
(5, 'Johnskin shop', 'Le Hoang Trang', 'Johnskin.com', 'Trade');

INSERT INTO OS_GOODS
VALUES
(1, 'Children clothes'),
(2, 'Gifts'),
(3, 'Furniture'),
(4, 'Laptop'),
(5, 'Cosmetic'),
(1, 'Cosmetic'),
(1, 'Books'),
(2, 'Books'),
(4, 'PC');


-- ==================== QUERY ==================
# 1. For each market, retrieve their name, manager, type, number of kiosks
SELECT Name, Manager, Type, NoOfKiosk as "Number of kiosks"
FROM MARKET;

# 2.1	Retrieve information of ministry of finance in with default order
SELECT *
FROM MINISTRY_OF_FINANCE;

# 2.2   Retrieve information of ministry of finance in with "specific our order"
SELECT mof.Name as "Ministry", mof.Minister, mof.Function, mof.StateBudget, mof. PublicAssets, mof.Budget
FROM MINISTRY_OF_FINANCE as mof;

# 3.	For each bank_branch of specific bank (use ID = 2), retrieve the Manager and where they located
SELECT Name, Manager, Address, ProvinceName, DistrictName
FROM BANK_BRANCH
WHERE BankID = 2;

# 4.	Retrieve information of bilateral trade in 2020
SELECT  b.ID, b.Country, b.Goods, b.Quantity, b.isImport
FROM BILATERAL_TRADE AS b
WHERE b.Year = 2020;

# 5.	For each school, retrieve their name, principle, which province, district they belong to and the head of division education they belong to
SELECT s.Name, s.Principal, s.ProvinceName, s.DistrictName, DOE.Head as "Head of division of education"
FROM SCHOOL as s
JOIN DIVISION_OF_EDUCATION DOE on s.DistrictName = DOE.DistrictName;

# 6. For each online shop, retrieve their ID, Name, owner and  number of goods
SELECT ol.ID, ol.Name, ol.Owner, COUNT(gd.Goods) as "Number of goods"
FROM ONLINE_SHOP AS ol
JOIN OS_GOODS AS gd WHERE ol.ID = gd.OS_ID
GROUP BY ol.ID;

# 7.	Retrieve the goods of specific online shop
SELECT ol.NAME, ol.Owner, GROUP_CONCAT(gd.Goods) as "Goods"
FROM ONLINE_SHOP as ol
JOIN OS_GOODS AS gd
WHERE ol.ID = gd.OS_ID AND ol.ID = 1 # online shop have id=1
GROUP BY ol.ID;

# 8.	Retrieve number vaccinated, unvaccinated, redzone and greenzone of Ho Chi Minh
SELECT SUM(vi.NoOfVaccinated) as "Number of Vaccinated", SUM(vi.NoOfUnvaccinated) as "Number of Unvaccinated",
(SELECT COUNT(*) FROM RED_ZONE rz WHERE rz.ProvinceName=vi.ProvinceName) AS "Number of redzone",
(SELECT COUNT(*) FROM GREEN_ZONE gz WHERE gz.ProvinceName=vi.ProvinceName) AS "Number of greenzone"
FROM VACCINATION_INFO vi
WHERE vi.ProvinceName = 'HCMC';

# 9.	Retrieve number vaccinated and unvaccinated;  redzone and greenzone of specific Ho Chi Minh, quan 10
SELECT SUM(vi.NoOfVaccinated) as "Number of Vaccinated", SUM(vi.NoOfUnvaccinated) as "Number of Unvaccinated",
(SELECT COUNT(*) FROM RED_ZONE rz WHERE rz.ProvinceName=vi.ProvinceName AND rz.DistrictName=vi.DistrictName) AS "Number of redzone",
(SELECT COUNT(*) FROM GREEN_ZONE gz WHERE gz.ProvinceName=vi.ProvinceName AND gz.DistrictName=vi.DistrictName) AS "Number of greenzone"
FROM VACCINATION_INFO vi
WHERE vi.ProvinceName = 'HCMC' AND vi.DistrictName = 'District 10';

# 10. Retrieve minister and their function of each ministry
SELECT Name, Minister, Function FROM MINISTRY_OF_EDUCATION
UNION
SELECT Name, Minister, Function FROM MINISTRY_OF_FINANCE
UNION
SELECT Name, Minister, Function FROM MINISTRY_OF_HEALTH
UNION
SELECT Name, Minister, Function FROM MINISTRY_OF_TRADE;


-- ====================== STORED PROCEDURE ===================
DROP PROCEDURE Get_all_OnlineShop_info;
DROP PROCEDURE Get_ministry_info;
DROP PROCEDURE Get_vaccine_info;

# 1.    Get online shop ID, Name, owner, goods and  number of goods (with no parameter)
DELIMITER //
CREATE PROCEDURE Get_all_OnlineShop_info()
BEGIN
    SELECT ol.ID, ol.Name, ol.Owner, GROUP_CONCAT(gd.Goods) as "Goods",COUNT(gd.Goods) as "Number of goods"
    FROM ONLINE_SHOP AS ol
    JOIN OS_GOODS AS gd WHERE ol.ID = gd.OS_ID
    GROUP BY ol.ID;
END //
DELIMITER ;
CALL Get_all_OnlineShop_info();


# 2.	Get information of specific ministry (with one parameter)
DELIMITER //
CREATE PROCEDURE Get_ministry_info(IN MinistryName VARCHAR(20))
BEGIN
    SELECT *
    FROM
        (
            SELECT Name, Minister, Function FROM MINISTRY_OF_EDUCATION
            UNION
            SELECT Name, Minister, Function FROM MINISTRY_OF_FINANCE
            UNION
            SELECT Name, Minister, Function FROM MINISTRY_OF_HEALTH
            UNION
            SELECT Name, Minister, Function FROM MINISTRY_OF_TRADE
        ) AS mof
    WHERE mof.Name = MinistryName;
END //
DELIMITER ;

CALL Get_ministry_info('Education');
CALL Get_ministry_info('Finance');
CALL Get_ministry_info('Health');
CALL Get_ministry_info('Trade');

# 3. Get number of vaccinated, unvaccinated, redzone, greenzone of given province and district (more than one parameters and with condition)
DELIMITER //
CREATE PROCEDURE Get_vaccine_info(IN ProvinceName VARCHAR(50), IN DistrictName VARCHAR(50))

BEGIN
    IF DistrictName IS NULL THEN

    SELECT SUM(vi.NoOfVaccinated) as "Number of Vaccinated", SUM(vi.NoOfUnvaccinated) as "Number of Unvaccinated",
    (SELECT COUNT(*) FROM RED_ZONE rz WHERE rz.ProvinceName=vi.ProvinceName) AS "Number of redzone",
    (SELECT COUNT(*) FROM GREEN_ZONE gz WHERE gz.ProvinceName=vi.ProvinceName) AS "Number of greenzone"
    FROM VACCINATION_INFO vi
    WHERE vi.ProvinceName = ProvinceName;

   ELSE

    SELECT SUM(vi.NoOfVaccinated) as "Number of Vaccinated", SUM(vi.NoOfUnvaccinated) as "Number of Unvaccinated",
    (SELECT COUNT(*) FROM RED_ZONE rz WHERE rz.ProvinceName=vi.ProvinceName AND rz.DistrictName=vi.DistrictName) AS "Number of redzone",
    (SELECT COUNT(*) FROM GREEN_ZONE gz WHERE gz.ProvinceName=vi.ProvinceName AND gz.DistrictName=vi.DistrictName) AS "Number of greenzone"
    FROM VACCINATION_INFO vi
    WHERE vi.ProvinceName = ProvinceName AND vi.DistrictName = DistrictName;

   END IF;

END //
DELIMITER ;

CALL Get_vaccine_info('HCMC', NULL);
CALL Get_vaccine_info('HCMC', 'District 10');
CALL Get_vaccine_info('Binh Thuan', NULL);
CALL Get_vaccine_info('Binh Thuan', 'Ham Tan');
CALL Get_vaccine_info('Dong Nai', NULL);
CALL Get_vaccine_info('Dong Nai', 'Long Khanh');

-- =================== TRIGGER ================
# TRIGGER BEFORE INSERT
# 1. This trigger is invoked automatically insert the NoOfVaccinated and NoOfUnvaccinated = 0 if someone tries to insert these value < 0.
DELIMITER //
CREATE TRIGGER before_insert_vaccineinfo
BEFORE INSERT ON VACCINATION_INFO FOR EACH ROW
BEGIN
IF NEW.NoOfVaccinated < 0 THEN SET NEW.NoOfVaccinated = 0;
END IF;
IF NEW.NoOfUnvaccinated < 0 THEN SET NEW.NoOfUnvaccinated = 0;
END IF;
END //
DELIMITER ;

INSERT INTO VACCINATION_INFO
VALUES ('Binh Thuan', 'Phan Thiet', 'Minh Luu', -1, -100); # The value < 0 will be set to 0

SELECT *
FROM VACCINATION_INFO;
-- =======> We can do this for multiple table have column is number format
