<html>
    <body>
        <div style="text-align:center">

            <?php
            use DevCoder\DotEnv;

            // require("dotenv.php")
            require_once "./php/dotenv.php";

            (new DotEnv(__DIR__ . '/.env'))->load();

            echo __DIR__ . '<br/>';
            echo getenv('SOME_VARIABLE');
            // dev
            echo getenv('SOME_OTHER_VARIABLE')
            ?>
        </div>
    </body>
</html>
