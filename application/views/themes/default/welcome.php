<div class="panel panel-default"> 
    <div class="map_canvas"></div>
</div>
<?php if (!empty($posts)): ?>
    <?php foreach ($posts as $post): ?>
        <div class="panel panel-default"><!-- Post -->
            <?php if (!empty($post['featured_image'])): ?>
                <div class="panel-img">
                    <img src="<?php echo BASE_URI . $post['featured_image'] ?>" alt="<?php echo $post['title']; ?>"/>
                </div>
            <?php endif; ?>
            <div class="panel-body content">
                <h2><a href="<?php echo site_url('read/' . $post['slug']) ?>"><?php echo $post['title'] ?></a></h2>
                <?php echo word_limiter(strip_tags($post['body'], '<p><br>'), 30) ?>
            </div>
            <div class="panel-footer">
                <div class="post-meta">
                    <span class="text-left"><i class="fa fa-calendar"></i> <?php echo date('d M Y', strtotime($post['published_at'])) ?> 
                    <!-- <i class="fa fa-bars"></i> <a href="#">Web Design</a>, <a href="#">Bootstrap</a></span>  -->
                    <!-- <span class="pull-right"><a href="single.html"><i class="fa fa-comments"></i> 23 Comments</a></span> -->
                </div>
            </div>
        </div><!-- End Post -->
    <?php endforeach; ?>
<?php endif; ?>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmv3CxKGHwr9AF58XcYW_S1g8FRtU9D-c&libraries=places"></script>
<script src="<?php echo base_url(); ?>assets/common/js/maps/gmap3.min.js"></script> 
<script>
    var ts;
    $('.map_canvas')
            .gmap3({
                center: [-7.316297, 108.197116],
                zoom: 13,
                mapTypeId: "shadeOfGrey",
                mapTypeControlOptions: {
                    mapTypeIds: [google.maps.MapTypeId.ROADMAP, "shadeOfGrey"]
                }
            })
            .marker([
                {position: [-7.316297, 108.197116]},
                {address: "Jl. Letnan Harun No. 1, Cipedes, Panglayungan, Cipedes, Tasikmalaya"}
            ])
            .styledmaptype(
            "shadeOfGrey",
            [{"featureType":"landscape","stylers":[{"hue":"#FFA800"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#53FF00"},{"saturation":-73},{"lightness":40},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FBFF00"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#00FFFD"},{"saturation":0},{"lightness":30},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#00BFFF"},{"saturation":6},{"lightness":8},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#679714"},{"saturation":33.4},{"lightness":-25.4},{"gamma":1}]}],
            {name: "Kota tasikmalaya"}
    );
    ;

</script>