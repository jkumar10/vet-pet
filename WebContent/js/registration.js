function createElementFromHtml(domString) {
    var fakeDiv = document.createElement("div");
    fakeDiv.innerHTML = domString;
    return fakeDiv.children[0];
}

function makeCompanyNamePage() {
    var pageDiv = createElementFromHtml(`
    <div class="page">
        <input id="companyNameInput" name="companyNameInput" type="text" placeholder="company name" />
    </div>
    `);
    var companyNameInput = pageDiv.querySelector("#companyNameInput");
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        var errors = [];
        if(companyNameInput.value.trim() == "") {
            errors.push("Please select an account type by clicking on the corresponding icon");
        }
        return errors;
    });

    return page;
}

function makeAccountTypePage() {
    var pageDiv = createElementFromHtml(`
    <div class="page">
        <div class="account-selector radio-group">
            <div class="radio icon" data-radio_value="Patient">
                <i class="account-type material-icons md-dark md-inactive">face</i>
                <p>Patient</p>
            </div>
            <div class="radio icon" data-radio_value="Doctor">
                <i class="account-type material-icons md-dark md-inactive">work</i>
                <p>Doctor</p>
            </div>
            <div class="radio icon" data-radio_value="Insurance Provider">
                <i class="account-type material-icons md-dark md-inactive">business</i>
                <p>Insurance Provider</p>
            </div>
            <input id="accountTypeInput" name="accountTypeInput" type="text" class="radio-input"/>
        </div>
    </div>
    `);
    var accountTypeInput = pageDiv.querySelector("#accountTypeInput");
    var accountRadioGroup = pageDiv.getElementsByClassName("radio-group")[0];
    console.log(accountRadioGroup);
    setupDivRadio(accountRadioGroup);
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        var errors = [];
        if(accountTypeInput.value == "") {
            errors.push("Please select an account type by clicking on the corresponding icon");
        }
        return errors;
    });

    page.setOnNextPage(function() {
        //TODO: Delete a page if it was added and changed...
        //Probably use a closure that holds the elements added then .parent and .removeChild

        //When an account is selected and the page is changed add a page later on that 
        //TODO: Change the 2 to a value found for the length of the elements - 1 so submit isn't moved
        if(accountTypeInput.value == "Patient") {
            page.pageViewParent.addPageAtEnd(makePetPage());
            page.pageViewParent.addPageAtEnd(makePersonalPage());
        } else if(accountTypeInput.value == "Doctor") {
            page.pageViewParent.addPageAtEnd(makeSpecialisationPage());
            page.pageViewParent.addPageAtEnd(makePersonalPage());
        } else if(accountTypeInput.value == "Insurance Provider") {
            page.pageViewParent.addPageAtEnd(makeCompanyNamePage());
        }
        page.pageViewParent.addPageAtEnd(makeSubmitPage());
    });

    return page;
}

function makePetPage() {
    var pageDiv = createElementFromHtml(`
        <div class='page'>
            <select id='petTypeInput' name="petTypeInput">
                <option value='Dog'>Dog</option> 
                <option value='Cat'>Cat</option>
            </select>
            <input type="number" placeholder="Pet Age" name="petAgeInput" id="petAgeInput">
        </div>
    `);
    //TODO: make work with enumerations
    var petInput = pageDiv.querySelector("#petTypeInput");
    var petAgeInput = pageDiv.querySelector("#petAgeInput");
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        if(petInput.value == "") {
            return ["Please select a pet type"];
        }
        if(petAgeInput.value == "") {
        	return ["Please select an age for your pet"];
        }
        return [];
    });
    
    return page;
}

function makePersonalPage() {
    var pageDiv = createElementFromHtml(`
    <div class="page">
        <input id="firstNameInput" name="firstNameInput" type="text" placeholder="first name">
        <input id="lastNameInput" name="lastNameInput" type="text" placeholder="last name">
        <input id="ageInput" name="ageInput" type="number" min="1" max="130" placeholder="age">
    </div>
    `);

    var firstNameInput = pageDiv.querySelector("#firstNameInput");
    var lastNameInput = pageDiv.querySelector("#lastNameInput");
    var ageInput = pageDiv.querySelector("#ageInput");
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        var errors = [];
        if(firstNameInput.value.trim() == "") {
            errors.push("Please enter a first name");
        }
        if(lastNameInput.value.trim() == "") {
            errors.push("Please enter a last name");
        }
        if(ageInput.value < 18) {
            errors.push("Must be atleast 18 years or older to use our system");
        }
        return errors;
    });
    
    return page;
}

function makeEmailPasswordPage() {
    var pageDiv = createElementFromHtml(`
        <div class="page">
            <input id="emailInput" name="emailInput" type="text" placeholder="Email Adress" autofocus>
            <input id="passwordInput" name="passwordInput" type="password" placeholder="Password">
        </div>
    `);

    var emailInput = pageDiv.querySelector("#emailInput");
    var passwordInput = pageDiv.querySelector("#passwordInput");
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        var errors = [];
        //TODO: Ensure that email is not already in use
        if(emailInput.value.trim() == "") {
            errors.push("Please enter an email");
        }
        if(passwordInput.value.trim() == "") {
            errors.push("Password must ...");
        }
        return errors;
    });
    
    return page;
}

function makeAddressPage() {
    var pageDiv = createElementFromHtml(`
        <div class="page">
            <input id="addressInput" name="addressInput" type="text" placeholder="address">
        </div>
    `);

    var addressInput = pageDiv.querySelector("#addressInput");
    
    var page = new Page(pageDiv);
    page.setNextPageRequirements(function() {
        var errors = [];
        //TODO: Ensure that email is not already in use
        if(addressInput.value.trim() == "") {
            errors.push("Please enter an address");
        }
        return errors;
    });
    
    return page;
}

function makeSubmitPage() {
    var pageDiv = createElementFromHtml(`
        <div class="page">
            <input type="submit">
        </div>
    `);

    
    var page = new Page(pageDiv);
    return page;
}

function makeSpecialisationPage() {
    var pageDiv = createElementFromHtml(`
        <div class="page">
            <input id="specialisationInput" name="specialisationInput" type="text" placeholder="specialisation">
        </div>
    `);

    var specialisationInput = pageDiv.querySelector("#specialisationInput");
    
    var page = new Page(pageDiv, function() {
        var errors = [];
        if(specialisationInput.value.trim() == "") {
            errors.push("Please state your specialisation");
        }
        return errors;
    });

    return page;
}

window.addEventListener("load", function() {
    var registrationForm = document.getElementById("account-form-page-view");
    var registrationPageView = new PageView(registrationForm);

    var accountTypePage = makeAccountTypePage(registrationPageView);
    var addressPage = makeAddressPage();
    var emailPasswordPage = makeEmailPasswordPage();

    registrationPageView.addPageAtEnd(accountTypePage);
    registrationPageView.addPageAtEnd(emailPasswordPage);
    registrationPageView.addPageAtEnd(addressPage); 
});