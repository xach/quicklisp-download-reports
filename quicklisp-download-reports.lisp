;;;; quicklisp-download-reports.lisp

(in-package #:quicklisp-download-reports)

;;; "quicklisp-download-reports" goes here. Hacks and glory await!

(defun this-month ()
  (multiple-value-bind (second minute hour day month year)
      (get-decoded-time)
    (declare (ignore second minute hour day))
    (format nil "~4,'0D-~2,'0D-~2,'0D" year month 1)))

(defun download-stats (&optional (month (this-month)))
  (postmodern:query
   (:order-by
    (:select (:count :*)
             (:split-part :cs-uri-stem "/" 3)
             :from :cloudfront-log-date-records
             :where (:and (:like :cs-uri-stem "/archive/%/%")
                          (:= :month month)
                          (:= :sc-status 200))
             :group-by (:split-part :cs-uri-stem "/" 3))
    (:desc 1))))

