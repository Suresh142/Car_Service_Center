<h1 class="text-light">Welcome to <?php echo $_settings->info('name') ?></h1>
<hr class="border-light">
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-light elevation-1"><i class="fas fa-th-list"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Category</span>
                <span class="info-box-number">
                  <?php 
                    $inv = $conn->query("SELECT count(id) as total FROM categories ")->fetch_assoc()['total'];
                    echo number_format($inv);
                  ?>
                  <?php ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="shadow info-box mb-3">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-users-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Mechanics</span>
                <span class="info-box-number">
                  <?php 
                    $mechanics = $conn->query("SELECT sum(id) as total FROM `mechanics_list` where status = '1' ")->fetch_assoc()['total'];
                    echo number_format($mechanics);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="shadow info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-th-list"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Services</span>
                <span class="info-box-number">
                <?php 
                    $services = $conn->query("SELECT sum(id) as total FROM `service_list` where status = 1 ")->fetch_assoc()['total'];
                    echo number_format($services);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <div class="col-12 col-sm-6 col-md-3">
            <div class="shadow info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-file-invoice"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Finished Requests</span>
                <span class="info-box-number">
                <?php 
                    $services = $conn->query("SELECT sum(id) as total FROM `service_requests` where status = 3 ")->fetch_assoc()['total'];
                    echo number_format($services);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        </div>
