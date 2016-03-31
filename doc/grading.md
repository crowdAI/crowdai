```
>>> from sklearn.metrics import classification_report
>>> y_true = [0,1,1,2,2,3,4]
>>> y_pred = [0,1,1,2,2,3,4]
>>> classification_report(y_true, y_pred)
'             precision    recall  f1-score   support\n\n          0       1.00      1.00      1.00         1\n          1       1.00      1.00      1.00         2\n          2       1.00      1.00      1.00         2\n          3       1.00      1.00      1.00         1\n          4       1.00      1.00      1.00         1\n\navg / total       1.00      1.00      1.00         7\n'
>>> print classification_report(y_true, y_pred)
             precision    recall  f1-score   support

          0       1.00      1.00      1.00         1
          1       1.00      1.00      1.00         2
          2       1.00      1.00      1.00         2
          3       1.00      1.00      1.00         1
          4       1.00      1.00      1.00         1

avg / total       1.00      1.00      1.00         7

>>> y_pred = [0,1,1,2,2,3,2]
>>> print classification_report(y_true, y_pred)
/usr/local/lib/python2.7/site-packages/sklearn/metrics/classification.py:1074: UndefinedMetricWarning: Precision and F-score are ill-defined and being set to 0.0 in labels with no predicted samples.
  'precision', 'predicted', average, warn_for)
             precision    recall  f1-score   support

          0       1.00      1.00      1.00         1
          1       1.00      1.00      1.00         2
          2       0.67      1.00      0.80         2
          3       1.00      1.00      1.00         1
          4       0.00      0.00      0.00         1

avg / total       0.76      0.86      0.80         7

>>> y_true
[0, 1, 1, 2, 2, 3, 4]
>>> y_pred
[0, 1, 1, 2, 2, 3, 2]
```
