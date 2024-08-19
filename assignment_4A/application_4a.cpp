#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/statement.h>
#include <cppconn/exception.h>

using namespace std;

int main(int argc,char**argv) {
    if(argc<4)
    {
        cout<<"usage:"<<argv[0]<<"<server> <user> <password>"<<endl;
    }
    
    sql::mysql::MySQL_Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;
    sql::ResultSet *res,*res2;
    sql::ResultSetMetaData *meta;
    int r1,r2,r3,r4,r5,r6;

    try {
        // Create connection
        driver = sql::mysql::get_mysql_driver_instance();
        con = driver->connect(argv[1], argv[2], argv[3]);

        // Execute SQL query
        stmt = con->createStatement();
        stmt->execute("USE academic_insti");
        res = stmt->executeQuery("SELECT * FROM professor");

        // Get metadata
        meta = res->getMetaData();
        int numCol = meta->getColumnCount();

        // Fetch and print results
        // while (res->next()) {
        //     for (int i = 1; i <= numCol; i++) { // Note: Column indexing starts from 1
        //         cout << meta->getColumnName(i) << ":" << res->getString(i) << endl;
        //     }
        // }

        // stmt->executeUpdate("insert into department values ('143','gopi','15347','1234567890')");

        int command=1;
        while(command)
        {

            string teacherId;
            string courseId;
            string deptId;
            string classroom;

            cout<<"enter teacherId"<<endl;
            cin>>teacherId;
            cout<<"enter courseId"<<endl;
            cin>>courseId;

            cout<<"enter deptId"<<endl;
            cin>>deptId;
            cout<<"enter classroom"<<endl;
            cin>>classroom;



            string course_query=
            "select *"
            "    from course as c"
            "    where c.courseId='"+courseId+"'";
            string dept_query =
            "SELECT * "
            "FROM department "
            "WHERE deptId='"+ deptId +"'";

            string prof_query=
            "select * "
            "from professor "
            "where empId='"+teacherId+"'";

            string course_dept_query=
        " select *"
        "    from course "
        "    where courseId='"+courseId+"' and deptNo='"+deptId+"'";

            string teaching_course_query=
        " select *"
        "    from teaching "
        "    where empId='"+teacherId+"' and courseId='"+courseId+"' and sem='even' and year='2006'";


        string insert_teaching=
        "insert into teaching values ('"+teacherId+"','"+courseId+"','even','2006','"+classroom+"')";
                                                    
            res=stmt->executeQuery(course_query);
            r1=res->rowsCount();

            res=stmt->executeQuery(dept_query);
            r2=res->rowsCount();

            res=stmt->executeQuery(prof_query);
            r3=res->rowsCount();

        


            int flag=1;

            if(r1==0)
            {
                cout<<"the given course "<<courseId<<" doesn't exist "<<endl;  
                flag=0;     
            }
            if(r2==0)
            {
                cout<<"the given department "<<deptId<<" doesn't exist "<<endl;
                flag=0;     
            }
            if(r3==0)
            {
                cout<<"the given professor "<<teacherId<<" doesn't exist "<<endl;  
                flag=0;     
            }
            if(flag==1)
            {
                res=stmt->executeQuery(course_dept_query);

                r4=res->rowsCount();
                if(r4==0)
                {
                    cout<<"the given course "<<courseId<<" doesn't belong to  department "<<deptId<<endl;
                    flag=0; 
                }
                    
            }
            if(flag==1)
            {
                res=stmt->executeQuery(teaching_course_query);

                r5=res->rowsCount();
                meta=res->getMetaData();
                int colnum=meta->getColumnCount();
                if(r5==0)
                {
                    //insert it
                    int rowsupdated=stmt->executeUpdate(insert_teaching);
                    cout<<"tuple with course "<<courseId<<" and teacher "<< teacherId<<" added"<<endl;

                }
                else{

                    string update_crc=
                    "update teaching "
                    "set classRoom ='"+classroom+"'"
                    "where empId='"+teacherId+"' and courseId='"+courseId+"' and sem='even' and year='2006'";

                    // check the the classroom and update
                    while(res->next())
                    {
                        for (int i=1;i<=colnum;i++)
                        {
                            if(meta->getColumnName(i)=="classRoom")
                            {
                                if(res->getString(i)==classroom)
                                {
                                    cout<<"tuple already  exists"<<endl;
                                }
                                else{
                                    int rowss=stmt->executeUpdate(update_crc);
                                    cout<<"tuple updated"<<endl;
                                }
                            }
                        
                        }
                    }



                }
                
            }


            string rollNo;
            // string courseId;

            cout<<"enter rollNo"<<endl;
            cin>>rollNo;
            cout<<"enter courseId"<<endl;
            cin>>courseId;

            course_query=
            "select *"
            "    from course as c"
            "    where c.courseId='"+courseId+"'";

            course_dept_query=
        " select *"
        "    from course "
        "    where courseId='"+courseId+"' and deptNo='"+deptId+"'";
            res=stmt->executeQuery(course_query);
            r1=res->rowsCount();




            string stud_query =
            "SELECT * "
            "FROM student "
            "WHERE rollNo='"+ rollNo +"'";


            res=stmt->executeQuery(stud_query);
            r2=res->rowsCount();

            flag=1;

            if(r1==0)
            {
                cout<<"the given course "<<courseId<<" doesn't exist "<<endl;  
                flag=0;     
            }
            if(r2==0)
            {
                cout<<"the given student "<<rollNo<<" doesn't exist "<<endl;  
                flag=0;
            }
            if(flag==1)
            {
                res=stmt->executeQuery(course_dept_query);

                r4=res->rowsCount();
                if(r4==0)
                {
                    cout<<"the given course "<<courseId<<" doesn't belong to  department "<<deptId<<endl;
                    flag=0; 
                }
            }
            if(flag==1)
            {

                string enroll_query=
                " select *"
                "        from enrollment"
                "        where rollNo='"+rollNo+"' and courseId='"+courseId+"'and year<='2006'";


                string insert_enroll="insert into enrollment(rollNo,courseId,sem,year,grade) values ('"+rollNo+"','"+courseId+"','even','2006',NULL);";

                res=stmt->executeQuery(enroll_query);
                meta=res->getMetaData();
                int colnum=meta->getColumnCount();

                r5=res->rowsCount();
                // cout<<r5<<" checking rows in enrollment"<<endl;
                if(r5==0)
                {
                    //check prerequistie then thing about enroll

                    string prerequiste_query=" select *"
                    "    from student as s"
                    "    where s.rollNo= '"+rollNo+"' and"
                    "        not exists("
                    "                    select *"
                    "                    from course as c,prerequisite as p"
                    "                    where p.courseId ='"+courseId+"' and"
                    "                        p.preReqCourse= c.courseId and"
                    "                        not exists ("
                    "                            select *"
                    "                            from enrollment as e"
                    "                            where e.rollNo=s.rollNo and"
                    "                                e.courseId='"+courseId+"' and"
                    "                                ((e.sem='even' and e.year<2006 )or (e.sem='odd' and e.year=2006)) and e.grade<>'U'"
                    "                        )"
                    "                )";
                    

                    res=stmt->executeQuery(prerequiste_query);
                    r4=res->rowsCount();
                    if(r4==0)
                    {
                        cout<<"Sorry! please complete all prerequistes of "<<courseId<<" course"<<endl;
                    }
                    else
                    {
                        int rowss=stmt->executeUpdate(insert_enroll);
                        cout<<"tuple added to the database"<<endl;
                    }


                }
                else{
                    // check the grade if U then add else say already enrolled
                    int flag1=0;
                    while(res->next())
                    {
                        for(int i=1;i<=colnum;i++)
                        {
                            if(meta->getColumnName(i)=="grade")
                            {
                                if(res->getString(i)!="U")
                                {
                                    cout<<rollNo<<" already enrolled in the course "<<courseId<<endl;
                                    flag1=1;

                                }
                                // else{
                                    
                                //     cout<<"got a U in previous in enrollment and new enrollment added in year 2006 "<<endl;

                                //     int rowss=stmt->executeUpdate(insert_enroll);
                                // }
                            }


                        }
                    }


                    if (flag1==0)
                    {
                        while(res->next())
                        {
                            for(int i=1;i<=colnum;i++)
                            {
                                if(meta->getColumnName(i)=="grade")
                                {
                                    if(res->getString(i)!="U")
                                    {
                                        
                                        cout<<"got a U in previous in enrollment and new enrollment added in year 2006 "<<endl;

                                        int rowss=stmt->executeUpdate(insert_enroll);

                                    }
                                    
                                }


                            }
                        }
                    }
                }

            }


            cout<<"if you want to continue press 1, for exit press 0"<<endl;
            cin>>command;   

        }
        
        
        
        // Clean up
        delete res;
        delete stmt;
        delete con;
    } catch (sql::SQLException &e) {
        cout << "SQL Exception: " << e.what() << endl;
    }

    return 0;
}
