<html>
    <head>
        <title>Video Game Database</title>
    </head>

    <body>
        <h2>Reset</h2>
        <p>Press button to reset the database to containing our default instance.</p>

        <form method="POST" action="project.php">
            <input type="hidden" id="resetTablesRequest" name="resetTablesRequest">
            <p><input type="submit" value="Reset" name="reset"></p>
        </form>

        <hr />

        <h2>Insert</h2>
        <p>Press Insert button to insert an award record.</p>
        <p>Press Display Award table button to show instances in the Award table. This button can be used before and after an insertion to see the differences.</p>
        <form method="POST" action="project.php"> 
            <input type="hidden" id="insertAwardRequest" name="insertAwardRequest">
            Award name: <input type="text" name="insertaname"> <br /><br />
            Organization: <input type="text" name="insertorganization"> <br /><br />
            Award year: <input type= integer name="insertawardyear"> <br /><br />
            Game ID: <input type= integer name="insertgID"> <br /><br />
            <input type="submit" value="Insert" name="insertSubmit"></p>
        </form>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="displayAwardRequest" name="displayAwardRequest">
            <input type="submit" value="Display Award table" name="displayAwardSubmit"></p>
        </form>

        <hr />

        <h2>Delete</h2>
        <p>Press Delete button to delete a review record.</p>
        <p>Press Display Review table button to show instances in the Review table. This button can be used before and after a deletion to see the differences.</p>
        <form method="POST" action="project.php"> 
            <input type="hidden" id="deleteReviewRequest" name="deleteReviewRequest">
            Platform name: <input type="text" name="deletepname"> <br /><br />
            Review ID: <input type="text" name="deleterid"> <br /><br />
            <input type="submit" value="Delete" name="deleteSubmit"></p>
        </form>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="displayReviewRequest" name="displayReviewRequest">
            <input type="submit" value="Display Review table" name="displayReviewSubmit"></p>
        </form>

        <hr />

        <h2>Update</h2>
        <p>Press Update button to update label in a record.</p>
        <p>Press Display Classify table button to show instances in the Classify table. This button can be used before and after an update to see the differences.</p>
        <form method="POST" action="project.php"> 
            <input type="hidden" id="updateClassifyRequest" name="updateClassifyRequest">
            Game ID: <input type="text" name="updategID"> <br /><br />
            Age rating standard: <input type="text" name="updatearstandard"> <br /><br />
            Old lable: <input type="text" name="updateoldlabel"> <br /><br />
            New label: <input type="text" name="updatenewlabel"> <br /><br />

            <input type="submit" value="Update" name="updateSubmit"></p>
        </form>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="displayClassifyRequest" name="displayClassifyRequest">
            <input type="submit" value="Display Classify table" name="displayClassifySubmit"></p>
        </form>

        <hr />

        <h2>Selection</h2>
        <p>Press the selection button to show all customer names and their email.</p>
        <form method="GET" action="project.php"> 
        <input type="hidden" id="selectGameRequest" name="selectGameRequest">
            <input type="submit" value="Select" name="selectionSubmit"></p>
        </form>

        <hr />

        <h2>Projection</h2>
        <p>Press Display Customer table button to show instances in the Customer table. This button can be used before a projection to see all data in Customer table.</p>
        <p>Press Projection button to update label in a record.</p>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="projectionCustomerRequest" name="projectionCustomerRequest">
            Age lower bound: <input type="text" name="projectionLower"> <br /><br />
            <input type="submit" value="Projection" name="projectionSubmit"></p>
        </form>  
        <form method="GET" action="project.php"> 
            <input type="hidden" id="displayCustomerRequest" name="displayCustomerRequest">
            <input type="submit" value="Display Customer table" name="displayCustomerSubmit"></p>
        </form>

        <hr />

        <h2>Join</h2>
        <p>Press the Join button to select what games produced by a specific developer team in a company.</p>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="JoinRequest" name="JoinRequest">
            Company name: <input type="text" name="joincompany"> <br /><br />
            Developer team name: <input type="text" name="joindname"> <br /><br />

            <input type="submit" value="Join" name="joinSubmit"></p>
        </form>

        <hr />

        <h2>Aggregation with Group By</h2>
        <p>Press the Group By button to count the number of countries that offers a game (group by game).</p>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="GroupByRequest" name="GroupByRequest">
            <input type="submit" value="Group By" name="groupbySubmit"></p>
        </form>

        <hr />

        <h2>Aggregation with Having</h2>
        <p>Press the Execute button to get games with an average rate that is at least 6.</p>
        <form method="GET" action="project.php"> 
        <input type="hidden" id="having" name="havingGameRequest">
            <input type="submit" value="Execute" name="having"></p>
        </form>

        <hr />

        <!-- Nested Aggregation with Group By: Find the most popular console be provided by games -->
        <h2>Nested Aggregation with Group By</h2>
        <p>Press the Display button to show the console that supports the most games along with the number of games.</p>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="largestConsoleCount" name="largestConsoleCount">
            <input type="submit" value="Display" name="displayForNestedAggSubmit"></p>
        </form>
        
        <hr />

        <h2>Division</h2>
        <p>Press the Division button to select games that has been classified in all age rating standards.</p>
        <form method="GET" action="project.php"> 
            <input type="hidden" id="DivisionRequest" name="DivisionRequest">
            <input type="submit" value="Division" name="divisionSubmit"></p>
        </form>  

        <hr />

        <?php
            $success = True; //keep track of errors so it redirects the page only if there are no errors
            $db_conn = NULL; // edit the login credentials in connectToDB()
            $show_debug_alert_messages = FALSE; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())

            function debugAlertMessage($message) {
                global $show_debug_alert_messages;
    
                if ($show_debug_alert_messages) {
                    echo "<script type='text/javascript'>alert('" . $message . "');</script>";
                }
            }

            function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
                //echo "<br>running ".$cmdstr."<br>";
                global $db_conn, $success;
    
                $statement = OCIParse($db_conn, $cmdstr);
                //There are a set of comments at the end of the file that describe some of the OCI specific functions and how they work
    
                if (!$statement) {
                    echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
                    echo htmlentities($e['message']);
                    $success = False;
                }
    
                $r = OCIExecute($statement, OCI_DEFAULT);
                if (!$r) {
                    echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                    $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
                    echo htmlentities($e['message']);
                    $success = False;
                }
    
                return $statement;
            }

            function executeBoundSQL($cmdstr, $list) {
                /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
            In this case you don't need to create the statement several times. Bound variables cause a statement to only be
            parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection.
            See the sample code below for how this function is used */
    
                global $db_conn, $success;
                $statement = OCIParse($db_conn, $cmdstr);
    
                if (!$statement) {
                    echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($db_conn);
                    echo htmlentities($e['message']);
                    $success = False;
                }
    
                foreach ($list as $tuple) {
                    foreach ($tuple as $bind => $val) {
                        //echo $val;
                        //echo "<br>".$bind."<br>";
                        OCIBindByName($statement, $bind, $val);
                        unset ($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
                    }
    
                    $r = OCIExecute($statement, OCI_DEFAULT);
                    if (!$r) {
                        echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                        $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                        echo htmlentities($e['message']);
                        echo "<br>";
                        $success = False;
                    }
                }
            }

            function connectToDB() {
                global $db_conn;
    
                // Your username is ora_(CWL_ID) and the password is a(student number). For example,
                // ora_platypus is the username and a12345678 is the password.
                $db_conn = OCILogon("", "", "dbhost.students.cs.ubc.ca:1522/stu");
    
                if ($db_conn) {
                    debugAlertMessage("Database is Connected");
                    return true;
                } else {
                    debugAlertMessage("Cannot connect to Database");
                    $e = OCI_Error(); // For OCILogon errors pass no handle
                    echo htmlentities($e['message']);
                    return false;
                }
            }

            function disconnectFromDB() {
                global $db_conn;
    
                debugAlertMessage("Disconnect from Database");
                OCILogoff($db_conn);
            }

            /**
             * execute a single sql command from a table.sql
             * helper function for HandleResetRequest
             */
            function excuteSingleSql($sql_file_path) {
                global $db_conn;

                //check the exist of file
                if (file_exists($sql_file_path)) {
                    echo "<br> executing SQL from file <br>";
                    $sql_content = file_get_contents($sql_file_path);
                    $sql_command = explode(';', $sql_content);

                    foreach ($sql_command as $tmp_sql_command) { //loop all command in the sql file
                        $tmp_sql_command = trim ($tmp_sql_command);
                        if (!empty($tmp_sql_command)) {
                            executePlainSQL($tmp_sql_command);
                        }
                    }                    
                    
                } else {
                    echo "<br> ERROR finding sql file <br>";
                    return false;
                }
            }
            
            function handleResetRequest() {
                global $db_conn;
                
                $sql_file_path = './table.sql'; // the path of the sql file we want to excute
                excuteSingleSql($sql_file_path);
                OCICommit($db_conn);
            }

            function handleInsertRequest() {
                global $db_conn;
    
                //Getting the values from user and insert data into the table
                $tuple = array (
                    ":bind1" => $_POST['insertaname'],
                    ":bind2" => $_POST['insertorganization'],
                    ":bind3" => $_POST['insertawardyear'],
                    ":bind4" => $_POST['insertgID']
                );
    
                $alltuples = array (
                    $tuple
                );
    
                executeBoundSQL("insert into award values (:bind1, :bind2, :bind3, :bind4)", $alltuples);
                OCICommit($db_conn);
            }
            
            function handleDisplayInsertRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT * FROM Award");
                printDisplayInsertResult($result);               
            }
            
            function handleDeleteRequest() {
                global $db_conn;
    
                //Getting the values from user and insert data into the table
                $tuple = array (
                    ":bind1" => $_POST['deletepname'],
                    ":bind2" => $_POST['deleterid']
                );

                $alltuples = array (
                    $tuple
                );

                executeBoundSQL("DELETE FROM REVIEW2 WHERE pname = :bind1 AND rid = :bind2", $alltuples);
                OCICommit($db_conn);
            }

            function handleDisplayDeleteRequest(){
                global $db_conn;
                $result = executePlainSQL("SELECT * FROM Review2");
                printDisplayDeleteResult($result);
            }

            function handleUpdateRequest() {
                global $db_conn;

                $update_gID = $_POST['updategID'];
                $update_arstandard = $_POST['updatearstandard'];
                $update_oldlabel = $_POST['updateoldlabel'];
                $update_newlabel = $_POST['updatenewlabel'];

                executePlainSQL("UPDATE Classify SET label = '" . $update_newlabel . "'WHERE gID ='" . $update_gID . "' AND label = '" . $update_oldlabel . "' AND ar_standard = '" . $update_arstandard . "'");

                OCICommit($db_conn);
            }

            function handleDisplayUpdateRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT * FROM Classify");
                printDisplayUpdateResult($result);
            }

            function handleSelectRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT customer_name, email FROM customer");
                printSelectResult($result);
            }

            function handleProjectionRequest($projection_lowerbound) {
                global $db_conn;
                $result = executePlainSQL("SELECT * FROM Customer WHERE EXTRACT(YEAR FROM CURRENT_DATE) - birth_year > $projection_lowerbound");
                echo "<br>Selected customers:<br>";
                printProjectionResult($result);
            }

            function handleBeforeProjectRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT * FROM Customer");
                echo "<br>All customers:<br>";
                printProjectionResult($result);
            }

            function handleJoinRequest(){
                global $db_conn;

                $company_name = $_GET['joincompany'];
                $d_name = $_GET['joindname'];

                $result = executePlainSQL("SELECT g.gname FROM GAME g, DEVELOPERTEAM d WHERE g.dID = d.dID AND d.dname = '". $d_name ."' AND d.company = '". $company_name ."'");
                printJoinResult($result);
            }

            function handleGroupByRequest(){
                global $db_conn;
                $result = executePlainSQL("SELECT g.gname, d.dname, d.company , COUNT(*) AS count FROM Offers o, Game g, DeveloperTeam d
                    WHERE o.gID = g.gID and g.dID = d.dID GROUP BY g.gname, d.dname, d.company");
                printGroupByResult($result);
            }

            function handleHavingRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT g.gname, d.company, d.dname, AVG(r.rate) AS average_rate FROM game g, review2 r, developerteam d WHERE g.gid = r.gid and g.did = d.did GROUP BY g.gname, d.company, d.dname HAVING AVG(r.rate) >= 6");
                printHavingResult($result);
            }

            function handleNestedAggregationRequest() {
                global $db_conn;
                $result = executePlainSQL("SELECT console_name, COUNT(gID) AS count 
                                           FROM ConsoleGame GROUP BY console_name
                                           HAVING COUNT(gID) = ( SELECT MAX(game_count)
                                                                 FROM ( SELECT console_name, COUNT(gID) AS game_count
                                                                        FROM ConsoleGame
                                                                        GROUP BY console_name
                                                                      ) countAllConsoleGame
                                                                )");
                printNestedAggregationResult($result);
            }

            function handleDivisionRequest(){
                global $db_conn;
                $result = executePlainSQL("SELECT g.gname, d.dname, d.company FROM Game g, DeveloperTeam d
                    WHERE g.did = d.did AND NOT EXISTS (
                        SELECT ar.ar_standard FROM AgeRating ar WHERE NOT EXISTS (
                        SELECT * FROM Classify c WHERE c.gid = g.gid AND c.ar_standard = ar.ar_standard))");
                printDivisionResult($result);
            }

            /* helper functions to print results*/
            function printDisplayInsertResult($result) {
                echo "<br>Instances in Award table:<br>";
                echo "<table>";
                echo "<tr><th>Award name</th><th>Organization</th><th>Award year</th><th>Game ID</th></tr>";
                               
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["ANAME"] . "</td><td>" . $row["ORGANIZATION"] . "</td><td>" . $row["AWARD_YEAR"] . "</td><td>" . $row["GID"] . "</td></tr>";                    
                }
    
                echo "</table>";                
            }

            function printDisplayDeleteResult($result){
                echo "<br>Instances in Review table:<br>";
                echo "<table>";
                echo "<tr><th>Review ID</th><th>Platform name</th><th>rate</th><th>Game ID</th><th>Version number</th><th>Customer ID</th><th>comment text</th></tr>";
                
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["RID"] . "</td><td>" . $row["PNAME"] . "</td><td>" . $row["RATE"] . "</td><td>" . $row["GID"] . "</td><td>" . $row["VERSION_NUMBER"] . "</td><td>" . $row["CID"] . "</td><td>" . $row["COMMENT_TEXT"] . "</td></tr>"; 
                }
    
                echo "</table>";
            }

            function printDisplayUpdateResult($result) { 
                echo "<br>Instances in Classify table:<br>";
                echo "<table>";
                echo "<tr><th>gID</th><th>ar_standard</th><th>label</th></tr>";
    
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["GID"] . "</td><td>" . $row["AR_STANDARD"] . "</td><td>" . $row["LABEL"] . "</td></tr>";                    
                }
    
                echo "</table>";
            }

            function printSelectResult($result) { 
                echo "<br>All customer name and email:<br>";
                echo "<table>";
                echo "<tr><th>Customer Name</th><th>Email</th></tr>";
    
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["CUSTOMER_NAME"] . "</td><td>" . $row["EMAIL"] . "</td></tr>"; //or just use "echo $row[0]"
                }
    
                echo "</table>";
            }

            function printProjectionResult($result) { 
                echo "<table>";
                echo "<tr><th>Customer ID</th><th>Customer name</th><th>email</th><th>Birth year</th></tr>";
    
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["CID"] . "</td><td>" . $row["CUSTOMER_NAME"] . "</td><td>" . $row["EMAIL"] . "</td><td>" . $row["BIRTH_YEAR"] . "</td></tr>";                    
                }
    
                echo "</table>";
            }

            function printJoinResult($result) { 
                echo "<br>Games developed by the above developer team:<br>";
                echo "<table>";
                
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["GNAME"] . "</td></tr>"; 
                }
    
                echo "</table>";
            }

            function printGroupByResult($result) {
                echo "<br>This table displays the number of countries that offer each game:<br>";
                echo "<table>";
                echo "<tr><th>Game name</th><th>Developer team name</th><th>Company name</th><th>Countries #</th></tr>";
                
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["GNAME"] . "</td><td>" . $row["DNAME"] . "</td><td>" . $row["COMPANY"] . "</td><td>" . $row["COUNT"] . "</td></tr>"; //or just use "echo $row[0]"
                }
    
                echo "</table>";
            }

            function printHavingResult($result) {
                echo "<br>Games with average rate at least 6:<br>";
                echo "<table>";
                // Corrected table headers
                echo "<tr><th>Game name</th><th>Company</th><th>Developer team name</th><th>Average rate</th></tr>";
            
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    // Corrected row creation
                    echo "<tr><td>" . $row["GNAME"] . "</td><td>" . $row["COMPANY"] . "</td><td>" . $row["DNAME"] . "</td><td>" . $row["AVERAGE_RATE"] . "</td></tr>";
                }
            
                echo "</table>";
            }
            
            function printNestedAggregationResult($result) {
                echo "<br>This table displays the console (or consoles) with the highest number of games:<br>";
                echo "<table>";
                echo "<tr><th>Console name</th><th>Count</th></tr>";
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["CONSOLE_NAME"] . "</td><td>" . $row["COUNT"] . "</td></tr>";                    
                }
    
                echo "</table>";                
            }

            function printDivisionResult($result) { 
                echo "<br>Games that have been classified in every age rating standard:<br>";
                echo "<table>";
                echo "<tr><th>Game name</th><th>Developer team name</th><th>Company name</th></tr>";
                
                while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                    echo "<tr><td>" . $row["GNAME"] . "</td><td>" . $row["DNAME"] . "</td><td>" . $row["COMPANY"] . "</td></tr>"; //or just use "echo $row[0]"
                }
    
                echo "</table>";
            }

            function handlePOSTRequest() {
                if (connectToDB()) {
                    if (array_key_exists('resetTablesRequest', $_POST)) {
                        handleResetRequest();
                    } else if (array_key_exists('insertAwardRequest', $_POST)) {
                        handleInsertRequest();
                    } else if (array_key_exists('deleteReviewRequest', $_POST)) {
                        handleDeleteRequest();
                    } else if (array_key_exists('updateClassifyRequest', $_POST)) {
                        handleUpdateRequest();
                    } 
    
                    disconnectFromDB();
                }
            }

            function handleGETRequest() {
                if (connectToDB()) {
                    if (array_key_exists('displayAwardRequest', $_GET)) {
                        handleDisplayInsertRequest();
                    } else if (array_key_exists('displayReviewRequest', $_GET)){
                        handleDisplayDeleteRequest();
                    } else if (array_key_exists('displayClassifyRequest', $_GET)){
                        handleDisplayUpdateRequest();
                    }else if (array_key_exists('selectGameRequest', $_GET)) {
                        handleSelectRequest();
                    } else if (array_key_exists('projectionCustomerRequest', $_GET)) {
                        $projection_lowerbound = $_GET['projectionLower'];
                        handleProjectionRequest($projection_lowerbound);
                    } elseif (array_key_exists('displayCustomerRequest', $_GET)) {
                        handleBeforeProjectRequest();
                    } else if (array_key_exists('JoinRequest', $_GET)) {
                        handleJoinRequest();
                    } else if (array_key_exists('havingGameRequest', $_GET)) {
                        handleHavingRequest();
                    } elseif (array_key_exists('displayForNestedAggSubmit', $_GET)) {
                        handleNestedAggregationRequest();
                    } else if (array_key_exists('GroupByRequest', $_GET)){
                        handleGroupByRequest();
                    } else if (array_key_exists('DivisionRequest', $_GET)){
                        handleDivisionRequest();
                    } 

                    disconnectFromDB();
                }
            }

            if (isset($_POST['reset']) || isset($_POST['insertSubmit']) || isset($_POST['deleteSubmit']) || isset($_POST['updateSubmit'])) {
                handlePOSTRequest();
            } else if (isset($_GET['displayAwardSubmit']) || isset($_GET['displayReviewSubmit']) || isset($_GET['displayClassifySubmit']) || isset($_GET['selectionSubmit']) || isset($_GET['projectionSubmit']) || isset($_GET['displayCustomerSubmit']) || isset($_GET['joinSubmit']) || isset($_GET['having']) || isset($_GET['displayForNestedAggSubmit']) || isset($_GET['groupbySubmit']) || isset($_GET['divisionSubmit'])) {
                handleGETRequest();
            }
        ?>

    </body>
</html>