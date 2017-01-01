<div class="widget default row row-cards-pf"  >
    <div class="widget-title">
        <h3>Info Kota</h3>
    </div>
    <div class="list-group">                    
        <div class="list-group-item"> 
            <div class="row-picture">
                <img class="img-responsive" width="50%" height="50%" src="<?php echo base_url(); ?>assets/uploads/tasik.png" alt="icon">
            </div>  
            <div class="row col-lg-12">
                <div class="col-lg-4"> Negara </div>
                <div class="col-lg-8">:&nbsp;Indonesia</div>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-4">Provinsi</div>
                <div class="col-lg-8">:&nbsp;Jawa Barat</div>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-4">Area</div>
                <div class="col-lg-8">:&nbsp;184.38 km2 (71.19 sq mi)</div>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-4">Populasi</div>
                <div class="col-lg-8">:&nbsp;808.506 jiwa</div>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-4">Kordinat</div>
                <div class="col-lg-8">:&nbsp;7°19′55,93″LU 108°13′30,26″BT</div>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-4">Zona Waktu</div>
                <div class="col-lg-8">:&nbsp;WIB (UTC+7)</div>
            </div> 
        </div>
    </div>                       
</div>    
<div class="widget row row-cards-pf" > 
    <div class="widget-title">
        <h3>Berita Terakhir</h3>
    </div>
    <div class="list-group">
        <?php if (!empty($this->general->getRecentPosts())): ?>
            <?php foreach ($this->general->getRecentPosts() as $post): ?>
                <div class="list-group-item">
                    <?php if (!empty($post['featured_image'])): ?>
                        <div class="row-picture">
                            <img class="img-responsive" src="<?php echo BASE_URI . $post['featured_image'] ?>" alt="icon">
                        </div>
                    <?php endif; ?>
                    <div class="row-content">
                        <h4><a href="<?php echo site_url('read/' . $post['slug']) ?>"><?php echo $post['title'] ?></a></h4>
                    </div>
                </div>
                <div class="list-group-separator"></div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>
<div class="widget row row-cards-pf">
    <div class="widget-title">
        <h3>Categories</h3>
    </div>
    <div class="widget-content list-menus">
        <ul>
            <?php if (!empty($this->general->getCategories())): ?>
                <?php foreach ($this->general->getCategories() as $category): ?>
                    <li><a href="<?php echo site_url('category/' . $category['slug']) ?>"><?php echo $category['name'] ?></a></li>
                <?php endforeach; ?>
            <?php endif; ?>
        </ul>
    </div>
</div> 
<div class="widget row row-cards-pf">
    <div class="widget-title">
        <h3>Tags</h3>
    </div>
    <div class="widget-content list-menus">
        <?php if (!empty($this->general->getTags())): ?>
            <?php foreach ($this->general->getTags() as $tag): ?>
                <a class="tags" href="<?php echo site_url('tag/' . $tag['slug']) ?>"><?php echo ucwords($tag['name']) ?></a>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>