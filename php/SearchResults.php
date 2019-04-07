<?php
  require_once 'db_connect.php';
  $conn = new mysqli("$hn","$un","$pw","$db");
  // Check connection
  if (mysqli_connect_errno()){
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
      die();
  }
  //get general info
  $search = mysqli_real_escape_string($conn, $_POST['search']);
?>

<!doctype html>
<html lang="en">
  <head>
    <!— Required meta tags —>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!— Bootstrap CSS —>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/agreektourism.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <title> #Agreektourism </title>
  </head>
  <body>
    <div class="agreeknavbar">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ffffff;">
            <a class="navbar-brand" href="index.php">
            <img src="../public/assets/logo.jpg" width="100%" height="100%">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavAltMarkup" >
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="InsertActivity.php" style="margin-left: 700px;">Προσθέστε την ιδέα σας</a>
                <a class="nav-item nav-link" href="#" style="margin-left: 30px;">Σχετικά με εμάς</a>
            </div>
            </div>
        </nav>
    </div>

    <div class="row">
        <div class="col-3">
            <div class="filters">
                <h5 style="margin-top:10%;margin-left:3%;margin-bottom: 5%;"> <b> Προτιμήσεις </b></h5>
                <div class="form-check filter">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                    <label class="form-check-label" for="defaultCheck1">
                        Θάλασσα
                    </label>
                </div>
                <div class="form-check filter">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                    <label class="form-check-label" for="defaultCheck2">
                        Βουνό
                    </label>
                </div>
                <div class="form-check filter">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                        <label class="form-check-label" for="defaultCheck2">
                            Ζώα
                        </label>
                </div>
                <div class="form-check filter">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                            <label class="form-check-label" for="defaultCheck2">
                                Μαγειρική
                            </label>
                </div>
                <div class="form-check filter">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                                <label class="form-check-label" for="defaultCheck2">
                                    Λαογραφία
                                </label>
                </div>
                <div class="form-check filter">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                        <label class="form-check-label" for="defaultCheck2">
                            Τέχνη
                        </label>
                </div>
                <div class="form-check filter">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                        <label class="form-check-label" for="defaultCheck2">
                            Γεωργία
                        </label>
                </div>
            </div>

            <div class="filters">
                <h5 style="margin-top:10%;margin-left:3%;margin-bottom: 5%;"> <b> Περίοδος </b></h5>
                <div class="form-check filter">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                        <label class="form-check-label" for="exampleRadios1">
                        Πρωί - Μεσημέρι
                        </label>
                    </div>
                    <div class="form-check filter">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                        <label class="form-check-label" for="exampleRadios2">
                        Μεσημέρι - Απόγευμα
                        </label>
                    </div>
                    <div class="form-check filter">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                        <label class="form-check-label" for="exampleRadios3">
                        Απόγευμα - Βράδυ
                        </label>
                    </div>
            </div>

            <div class="dropdown show">
                    <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top:9%;margin-left:5%;width:300px;">
                        Ταξινόμηση κατά
                    </a>

                    <div class="dropdown-menu filter" aria-labelledby="dropdownMenuLink">
                      <a class="dropdown-item filter" href="#">Τιμή</a>
                      <a class="dropdown-item filter" href="#">Κριτική </a>
                      <a class="dropdown-item filter" href="#">Ημερομηνία</a>
                    </div>
            </div>

        </div>

        <div class="col">
            <?php
                require_once 'db_connect.php';
                $conn = new mysqli($hn,$un,$pw,$db);
                if ($conn->connect_error) die ($conn->connect_error);
                // support greek
                mysqli_query($conn, "SET NAMES 'utf8'");
                $sql = "SELECT idActivities, title, quote, photoUrl, isProduct FROM Activities WHERE regionId IN (SELECT idRegions FROM Regions WHERE regionName LIKE '%$search%')";
                if ($res_data = mysqli_query($conn, $sql)){
                    //echo "search success!!.";
                }
                else {
                    echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
                }
                $row_cnt = $res_data->num_rows;
                if ($row_cnt == 0) {
                  echo '<div class="row justify-content-center" >
                          <div class="col-9">
                            <div class="jumbotron" style="margin-top:6%; background-color:#F8F9FA;">
                              <h1 class="display-4" align="center">Δεν βρέθηκαν αποτελέσματα!</h1>
                              <p class="lead" align="center">Δεν βρέθηκαν αποτελέσματα αναζήτησης με τίτλο: <h4 align="center">' .$search . '</h4></p>
                              <hr class="my-4">
                              <p align="center">Μεταβείτε στην αρχική.</p>
                              <a class="btn btn-primary btn-lg" href="./index.php" role="button" style="margin-left:47%;">Αρχική</a>
                            </div>
                          </div>
                        </div>';
                }
                else {
                    echo '<div class="row" style="margin-top:3%; margin-left: 5%;">
                              <div class="form-group">
                                  <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value='.$search.' placeholder="Αναζητήστε προορισμούς,προιόντα,έθιμα..." style="width:900px;">
                              </div>
                          </div>';
                    echo '<div class="row" style="margin-top:2%;">
                            <h4 style="margin-left:6%;"> <b> Αποτελέσματα </b> </h4>
                            <div class="container" style="margin-right:5%;">';
                    while($row = mysqli_fetch_array($res_data)){
                        if ($row["isProduct"] == 0) {
                            echo '<form action="./Activity.php" method="post">';
                        }
                        else {
                            echo '<form action="./BuyProduct.php" method="post">';
                        }
                        echo '<div class="card flex-row flex-wrap">
                                  <div class="card-header border-0">
                                      <img width="150px" src="' . $row["photoUrl"] . '" alt="">
                                  </div>
                                  <div class="card-block px-2">
                                      <h5 style="margin-top:2%;" class="card-title">' . $row["title"] . '</h5>
                                      <p class="card-text">' . $row["quote"] . '</p>
                                      <input type="hidden" name="result" id="result" value="' . $row["idActivities"] . '">
                                      <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom:2%;"> Προβολή </a>
                                  </div>
                                  <div class="w-100"></div>
                              </div>
                              <br>
                          </form>';
                    }
                    echo '  </div>
                          </div>
                          <div class="row" style="margin-left:1%;">
                              <nav aria-label="Page navigation example">
                                      <ul class="pagination">
                                          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                                          <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                      </ul>
                                      </nav>
                          </div>';
                }
                mysqli_close($conn);
            ?>
        </div>
    </div>

    <!— Footer —>
    <hr style="margin-top: 10%;">
    <div style="background-color: white;">
      <!— Copyright —>
      <div class="footer-copyright text-center py-3">© 2019 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/"> Team 69</a>
      </div>
      <!— Copyright —>
    </div>
    <!— Footer —>

    <!— Optional JavaScript —>
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
