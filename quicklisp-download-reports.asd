;;;; quicklisp-download-reports.asd

(asdf:defsystem #:quicklisp-download-reports
  :description "Quick and dirty data extraction from the Cloudfront log data."
  :author "Zach Beane <xach@xach.com>"
  :license "MIT"
  :depends-on (#:postmodern)
  :serial t
  :components ((:file "package")
               (:file "quicklisp-download-reports")))

