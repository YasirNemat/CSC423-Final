import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "./instantclient_18_5")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu
connection = cx_Oracle.connect(
    "user", "password", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()
def query_one():
    cursor.execute("""
        SELECT s.FirstName, s.LastName, e.SectionID
        FROM Students s, Enrollments e
        WHERE s.StudentID=e.StudentID AND FeePaid='Paid' AND SectionID=11122334
        """)
def query_two():
    cursor.execute("""
        SELECT *
        FROM AvailableCourses
        """)
def query_three():
    cursor.execute("""
        SELECT *
        FROM Sections
        WHERE DayOfWeek='Monday'
        """)
def query_four():
    cursor.execute("""
        SELECT t.FirstName, t.LastName, s.SectionID, a.CourseName
        FROM Tutors t, Sections s, AvailableCourses a
        WHERE t.TutorID=s.TutorID AND s.SectionID=a.SectionID
        """)
def query_five():
    cursor.execute("""
        SELECT s.FirstName, s.LastName, e.SectionID, a.CourseName, e.FeePaid
        FROM Students s, Enrollments e, AvailableCourses a
        WHERE s.StudentID=e.StudentID AND e.SectionID=a.SectionID
        """)
query=input("\nWhich query would you like to run?\n\n1=All Students who are registered and paid for Section 11122334\n2=List the courses and the available offerings for them\n3=List all sections that are held on Mondays\n4=List the First and Last Name of all Tutors and which sections they teach along with the course name\n5=List All Students and the Sections they're taking and what course the section is for, as well as whether the student has paid or not\n\n")
if query=='1':
    query_one()
if query=='2':
    query_two()
if query=='3':
    query_three()
if query=='4':
    query_four()
if query=='5':
    query_five()


# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)
# print(df['FIRSTNAME']) # example to extract a column
cursor.close()
connection.commit()