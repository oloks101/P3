// Creating PVC for WordPress Pod
resource "kubernetes_persistent_volume_claim" "wp-pvc1" {
  metadata {
    name   = "wp-pvc1"
    labels = {
      env     = "Production"
      Country = "US" 
    }
  }

  wait_until_bound = false
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
  }
}


// Creating Deployment for WordPress
resource "kubernetes_deployment" "wp-dep" {
  metadata {
    name   = "wp-dep"
    labels = {
      env     = "Production"
      Country = "US" 
    }
  }
  wait_for_rollout = false

  spec {
    replicas = 2
    selector {
      match_labels = {
        pod     = "wp"
        env     = "Production"
        Country = "US" 
        
      }
    }

    template {
      metadata {
        labels = {
          pod     = "wp"
          env     = "Production"
          Country = "US"  
        }
      }

      spec {
        volume {
          name = "wp-vol"
          persistent_volume_claim { 
            claim_name = kubernetes_persistent_volume_claim.wp-pvc1.metadata.0.name
          }
        }

        container {
          image = "wordpress:4.8-apache"
          name  = "wp-container"

           env {
            name  = "WORDPRESS_DB_HOST"
            value = aws_db_instance.default.endpoint
          }
          env {
            name  = "WORDPRESS_DB_USER"
            value = aws_db_instance.default.username
          }
          env {
            name  = "WORDPRESS_DB_PASSWORD"
            value = aws_db_instance.default.password
          }
          env{
            name  = "WORDPRESS_DB_NAME"
            value = aws_db_instance.default.db_name
          }
          env{
            name  = "WORDPRESS_TABLE_PREFIX"
            value = "wp_"
          }
          volume_mount {
              name       = "wp-vol"
              mount_path = "/var/www/html/"
          }

          port {
            container_port = 80
          }
        }
      }
    }
  }
}


// Creating LoadBalancer Service for WordPress Pods
resource "kubernetes_service" "wpService" {
  metadata {
    name   = "wp-svc"
    labels = {
      env     = "Production"
      Country = "US" 
    }
  }  

  depends_on = [
    kubernetes_deployment.wp-dep
  ]

  spec {
    type     = "LoadBalancer"
    selector = {
      pod = "wp"
    }

    port {
      name = "wp-port"
      port = 80
    }
  }
}

//Wait For LoadBalancer to Register IPs
resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"
  depends_on = [kubernetes_service.wpService]  
}
