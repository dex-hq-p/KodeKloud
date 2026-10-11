"""
MLflow experiment logging — three TODO blocks below record a training
run with MLflow.

The model and data in this script are synthetic. A trivial
DummyClassifier stands in for a trained model so that the MLflow
logging calls have a real sklearn estimator to persist, and the
accuracy/F1 scores are computed from its predictions on a small fixed
fixture — not hardcoded. The purpose of the lab is to practise the
MLflow logging API, not to reason about model quality.

The three `# TODO` blocks inside the `mlflow.start_run()` context
are the only edits required.
"""
import numpy as np
import mlflow
import mlflow.sklearn
from sklearn.dummy import DummyClassifier
from sklearn.metrics import accuracy_score, f1_score

mlflow.set_tracking_uri("http://localhost:5000")

# Hyperparameters the run should record as MLflow parameters.
params = {"n_estimators": 100, "max_depth": 5, "random_state": 42}

# Synthetic "trained" model — a DummyClassifier fit on a small set of
# deterministic rows so it has valid internal state for
# mlflow.sklearn.log_model to serialise. No real learning takes place.
X_fit = np.array([[0.0], [1.0], [2.0], [3.0]])
y_fit = np.array([1, 1, 1, 0])
model = DummyClassifier(strategy="most_frequent").fit(X_fit, y_fit)

# Evaluation scores computed from the model's own predictions on the
# fixture above — deterministic and reproducible (accuracy 0.75,
# f1_score ~0.857), not fabricated constants.
preds = model.predict(X_fit)
accuracy = accuracy_score(y_fit, preds)
f1 = f1_score(y_fit, preds)

with mlflow.start_run():
    # TODO 1: log every entry in `params` as an MLflow parameter so that
    # n_estimators, max_depth, and random_state become searchable
    # parameters on this run.
    mlflow.log_params(params)

    # TODO 2: log `accuracy` and `f1` as MLflow metrics named
    # "accuracy" and "f1_score" respectively.
    mlflow.log_metric("accuracy", accuracy)
    mlflow.log_metric("f1_score", f1)

    # TODO 3: log the trained `model` as an MLflow sklearn model
    # artefact on this run.
    mlflow.sklearn.log_model(model, "model")


    print(f"accuracy={accuracy}, f1_score={f1}")
