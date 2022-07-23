<?php


// This whole file is for Helper Functions


function set_message($msg) {
   
    if(!empty($msg)) {
   
        $_SESSION['message'] = $msg;
    
    } else {

        $msg = "";
   
   
    }



}

function display_message() {

    if(isset($_SESSION['message'])) {

        echo $_SESSION['message'];
        
        unset($_SESSION['message']); // remove the message on refresh

    }
}


function redirect($location) {
    
header("Location: $location");


}

function query($sql) {
   
    global $connection;

    return mysqli_query($connection, $sql);  
       
   
}


function confirm($result) {
   
    global $connection;

    if(!$result) {

        die("QUERY FAILD".mysqli_error($connection));
    }

 
}

function escape_string($string) {
   
    global $connection;
         
            return mysqli_real_escape_string($connection, $string);

}


function fetch_array($result) {

    return mysqli_fetch_array($result);
}





// ********* FRONT-END Functions **********//









// Get Products

function get_products() {

    $query = query("SELECT * FROM products"); // reuse of "query" helper function line 12 above
    confirm($query); // reuse of "confirm" helper function line 22 above

       while($row = fetch_array($query)) {
   
    $product = 
    <<<DELIMETER
    <!-----PLEASE Keep this comment line intact or leave it Empty...! ------>
    <div class="col-sm-4 col-lg-4 col-md-4">
    <div class="thumbnail">
    <a href="item.php?id={$row['product_id']}"><img src="{$row['product_image']}" alt=""></a>                       
        <div class="caption">
            <h4 class="pull-right">&#36;{$row['product_price']}</h4>
            <h4><a href="item.php?id={$row['product_id']}">{$row['product_title']}</a></h4>
             <p>{$row['short_desc']}</p>
            <a class="btn btn-primary" target="_blank" href="cart.php?add={$row['product_id']}">Add to Cart</a>
        </div>  
            
    </div>
</div> 

DELIMETER;
                 
 echo  $product;

    }

}

// ************* ========= Get Category Products =========== **********//

function get_product_in_cat_page() {

    $query = query("SELECT * FROM products WHERE product_category_id = " . escape_string($_GET['id']) . " "); // reuse of "query" helper function line 12 above
    confirm($query); // reuse of "confirm" helper function line 22 above
 
    while($row = fetch_array($query)) {
   
    $product_in_cat = 
    <<<DELIMETER
    <!----- PLEASE Keep this comment line intact or leave it Empty...! ------>
    <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <a href="item.php?id={$row['product_id']}"><img src="{$row['product_image']}" alt=""></a>    
                    <div class="caption">
                        <h4><a href="item.php?id={$row['product_id']}">{$row['product_title']}</a></h4>
                        <p>{$row['short_desc']}</p>
                        <p>
                            <a href="item.php?id={$row['product_id']}" class="btn btn-primary">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>
DELIMETER;                
    
echo  $product_in_cat;

    }

}

function get_product_in_shop_page() {

   
$query = query("SELECT * FROM products"); // reuse of "query" helper function line 12 above
    confirm($query); // reuse of "confirm" helper function line 22 above

    
    while($row = fetch_array($query)) {
   
    $product_in_shop = 
    <<<DELIMETER
    <!----- PLEASE Keep this comment line intact or leave it Empty...! ------>
    <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <a href="item.php?id={$row['product_id']}"><img src="{$row['product_image']}" alt=""></a>    
                    <div class="caption">
                        <h4><a href="item.php?id={$row['product_id']}">{$row['product_title']}</a></h4>
                        <p>{$row['short_desc']}</p>
                        <p>
                            <a href="item.php?id={$row['product_id']}" class="btn btn-primary">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>
DELIMETER;                
    
echo  $product_in_shop;


    }


}





function get_categories() {

    $query = query("SELECT * FROM categories");
    confirm($query);
      
    while($row = fetch_array($query)){

        $categories_links = <<<DELIMETER
    <!-----PLEASE Keep this comment line intact or leave it Empty...! ------>
    <a href='category.php?id={$row['cat_id']}' class='list-group-item'>{$row['cat_title']}</a> 

DELIMETER;

echo $categories_links;
                    
        }
         

}













function login_user(){
 
if(isset($_POST['submit'])) {

    $username = escape_string($_POST['username']);
    $password = escape_string($_POST['password']);

$query = query("SELECT * FROM users WHERE username = '{$username}' AND password = '{$password}' ");
confirm($query);
  
if(mysqli_num_rows($query) == 0) {

    set_message("Your Username & Password Don't match ..!");
    redirect("login.php"); // redirect a helper function line 5 above


} else {
    set_message("{$username}, You have full access now..!");
    redirect("admin"); // admin folder (dashboard)

    }


    }







}


//**** =============== Contact form ================ ****//
function send_message() {
   
    if(isset($_POST['submit'])) {

       $to        = "benamer@gmail.com";
       $from_name = $_POST['name'];
       $subject   = $_POST['subject'];
       $email     = $_POST['email'];
       $message   = $_POST['message'];


        $headers = "From: {$from_name} - {$email}";


        $result = mail($to, $subject, $message, $headers);

        if($result) {
            set_message("Sorry we couldn't send your message ..!");
            redirect("contact.php");
            // echo "ERROR, can NOT send message";
        
        } else {

            // echo "Message SENT :) ..";
            set_message("Your message has been sent ..!");
            redirect("contact.php");
        }
    }
}

// ************************ BACK-END Functions*************************//



?>