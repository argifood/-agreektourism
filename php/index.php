<?php
  session_start();
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
    <title> #Agreektourism </title>
  </head>
  <body>
    <div class="search-activity">
        <div class="row">
            <a href="InsertActivity.php" style=" margin-top: 20px; margin-left: 900px; color:  #283747;"><b>Προσθέστε την ιδέα σας</b></a>
            <a href="#" style="margin-top: 20px; margin-left: 50px; color:  #283747;"><b>Σχετικά με εμάς</b></a>
        </div>
        <form action="./SearchResults.php" method="post">
            <div class="row">
                <div class="jumbotron" >
                    <div class="input-group">
                        <div class="row">
                            <label for="search"> <b> Αναζήτηση </b> </label>
                            <input type="text" class="form-control" name="search" id="search" placeholder="Προορισμούς,προιόντα,έθιμα...">
                        </div>
                        <div class="row" style="margin-top:5%;">
                            <label for="activity-date" class="col-form-label"> <b>Ημερομηνία</b> </label>
                            <input class="form-control" type="date" value="2019-06-03" id="activity-date">
                        </div>
                        <div class="row" style="margin-top:5%;">
                            <label for="activity-number-of-people" class="col-form-label"> <b> Αριθμός Ατόμων </b> </label>
                            <input class="form-control" type="number" value="1" id="activity-number-of-people">
                        </div>
                    </div>
                    <div class="row" style="margin-top:8%;">
                        <button type="submit" class="btn btn-dark" style="margin-bottom:2%;"> Αναζήτηση </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!— Optional JavaScript —>
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
