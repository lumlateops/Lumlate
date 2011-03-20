function newsubmit(event) {
    var target = event ? event.target : this;

    // do anything you like here
    alert('Submitting form to ' + target.action);

    // call real submit function
    return false;
}

// capture the onsubmit event on all forms
window.addEventListener('submit', newsubmit, true);

// If a script calls someForm.submit(), the onsubmit event does not fire,
// so we need to redefine the submit method of the HTMLFormElement class.
HTMLFormElement.prototype._submit = HTMLFormElement.prototype.submit;
HTMLFormElement.prototype.submit = newsubmit;
