<?php
 
        $connect = mysqli_connect('localhost:3306', 'user', 'password', 'db') or die("fail");
 
        $email=$_GET[email];
        $userID=$_GET[userID];
        $password=$_GET[password];
        $name=$_GET[name];
        $phonenumber=$_GET[phonenumber];

        $date = date('Y-m-d H:i:s');
 
        
        $query = "insert into member (email, userID, name, phonenumber, date, permit) values ('$email','$userID', '$name', '$password', '$phonenumber', '$date', 0)";
 
 
        $result = $connect->query($query);
 

        if($result) {
        ?>      <script>
                alert('Finished');
                location.replace("./login.php");
                </script>
 
<?php   }
        else{
?>              <script>
                        
                        alert("fail");
                </script>
<?php   }
 
        mysqli_close($connect);
?>
