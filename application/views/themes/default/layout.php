<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <title><?php echo $page_title ?> - CI Blog</title>
        <link rel="shortcut icon" href="<?php echo $base_assets_url; ?>main/img/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="152x152"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-152.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="76x76"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-76.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-72.png">
        <link rel="apple-touch-icon-precomposed" sizes="120x120"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-180.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-114.png">
        <link rel="apple-touch-icon-precomposed" sizes="57x57"
              href="<?php echo $base_assets_url; ?>main/img/apple-touch-icon-precomposed-57.png">
         
        <link href="<?php echo $base_assets_url; ?>main/css/patternfly.min.css"
              rel="stylesheet" media="screen, print">
        <link href="<?php echo $base_assets_url; ?>main/css/patternfly-additions.min.css"
              rel="stylesheet" media="screen, print">

        <link href="<?php echo $base_assets_url; ?>main/css/style1.css"
              rel="stylesheet" media="screen, print">
    </head>
    <body class="cards-pf">
        <div id="wrapper">
            <?php echo $header; ?>
            <div class="container-fluid container-cards-pf" style="margin-top: 5%;">
                <div class="row row-cards-pf">
                    <div class="row">
                        <div class="col-md-8">
                            <?php echo $content; ?>
                        </div>
                        <div class="col-md-4">
                            <?php echo $right_sidebar; ?>
                        </div>
                    </div>
                </div>      
            </div>
            <?php echo $footer; ?> 
        </div> 
        <script src="<?php echo base_url(); ?>assets/common/js/jquery/jquery-2.1.1.min.js"></script> 
        <script src="<?php echo base_url(); ?>assets/common/js/jquery/jquery.matchHeight-min.js"></script>  

        <?php if (!empty($home_page)): ?>
            <script type="text/javascript">

                $(window).scroll(function () {
                    if ($(this).scrollTop() > 1) {
                        $('.top-navbar').removeClass('navbar-transparent');
                    } else {
                        $('.top-navbar').addClass('navbar-transparent');
                    }
                });
            </script>
        <?php endif; ?> 
    </body>
</html>