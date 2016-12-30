<nav class="navbar navbar-default navbar-pf navbar-fixed-top" role="navigation">
  <div class="navbar-header">
    <a class="navbar-brand" href="/">
      <img src="<?php echo BASE_URI; ?>assets/themes/default/main/img/brand.svg" alt="PatternFly Enterprise Application">
    </a>
  </div>
  <div class="collapse navbar-collapse navbar-collapse-1">
    <ul class="nav navbar-nav navbar-utility">
      <li>
        <a href="#"><?php echo date("d/m/Y" ); ?></a>
      </li> 
    </ul>
    <ul class="nav navbar-nav navbar-primary">
        <?php echo $main_menus;?> 
    </ul>
  </div>
</nav> 


              