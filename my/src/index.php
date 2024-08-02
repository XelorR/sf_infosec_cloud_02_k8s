<html lang="en">

<head>
  <title>US East Coast Regions</title>
  <link rel="stylesheet" href="style.css" type="text/css" />
</head>

<body>
  <div style="width: 50%; margin: auto;">
    <h1>US East Coast Regions sorted by population</h1>
    <table>
      <tr>
        <th>region</th>
        <th>maincity</th>
        <th>population</th>
      </tr>
      <?php
      $mysqli = new mysqli("db", "user", "password", "mydb");
      if ($mysqli->ping()) {
        echo "Our connection is ok!";
      } else {
        echo "Error: %s\n", $mysqli->error;
      }
      $result = $mysqli->query("SELECT * FROM regions ORDER BY population DESC") or die(mysqli_error($mysqli));
      foreach ($result as $row) {
        echo "
      <tr>
        <td>{$row['region']}</td>
        <td>{$row['maincity']}</td>
        <td>{$row['population']}</td>
      </tr>
      ";
      } ?>
    </table>
  </div>
  <?php
  phpinfo();
  ?>
</body>

</html>