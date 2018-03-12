<?php

/* 
place this script on your index.php file under nginx root directory - usually /var/www/html
this will convert csv file into a table. referenced from https://www.zimplicit.se/en/knowledge/convert-csv-file-html-table-php.
*/

$row = 1;
if (($handle = fopen("/home/user/Documents/URL_Monitoring/pt_result.csv", "r")) !== FALSE) {
   
    echo '<table border="2">';
   
    while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
        $num = count($data);
        if ($row == 1) {
            echo '<thead><tr>';
        }else{
            echo '<tr>';
        }
       
        for ($c=0; $c < $num; $c++) {
            //echo $data[$c] . "<br />\n";
            if(empty($data[$c])) {
               $value = "&nbsp;";
            }else{
               $value = $data[$c];
            }
            if ($row == 1) {
                echo '<th>'.$value.'</th>';
            }else{
                echo '<td>'.$value.'</td>';
            }
        }
       
        if ($row == 1) {
            echo '</tr></thead><tbody>';
        }else{
            echo '</tr>';
        }
        $row++;
    }
   
    echo '</tbody></table>';
    fclose($handle);
}
?>
