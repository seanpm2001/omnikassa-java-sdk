<#import "macros.ftl" as macros />

<form method="post" action="/webshop/orders" name="order">
    <p>
        <a class="btn" data-bs-toggle="collapse" href="#customerInfo" role="button" aria-expanded="false"
           aria-controls="customerInfo">
            Enter Customer information
        </a>
        <a class="btn" data-bs-toggle="collapse" href="#addressInfo" role="button" aria-expanded="false"
           aria-controls="addressInfo">
            Enter address
        </a>
        <a class="btn" data-bs-toggle="collapse" href="#paymentInfo" role="button" aria-expanded="false"
           aria-controls="paymentInfo">
            Select Payment
        </a>
    </p>
    <div class="collapse" id="customerInfo">
        <p class="h6">Customer Info</p>
        <table class="table">
            <tr>
                <td>
                    <label for="customer_information_initials">Initials:</label>
                </td>
                <td>

                    <input type="text" name="initials" id="customer_information_initials" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customer_information_full_name">Full name:</label>
                </td>
                <td>
                    <input type="text" name="fullName" id="customer_information_full_name" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customer_information_birth_date">Birth date:</label>
                </td>
                <td>
                    <input type="text" name="birthDate" id="customer_information_birth_date" placeholder="DD-MM-YYYY"
                           class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customer_information_phone_number">Phone number:</label>
                </td>
                <td>
                    <input type="text" name="phoneNumber" id="customer_information_phone_number" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customer_information_email">E-mail address:</label>
                </td>
                <td>
                    <input type="text" name="email" id="customer_information_email" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customer_information_gender">Gender:</label>
                </td>
                <td>
                    <select name="gender" id="customer_information_gender" class="form-select">
                        <option value="" selected="selected"></option>
                        <option value="F">Female</option>
                        <option value="M">Male</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
    <br/>

    <div class="collapse" id="addressInfo">
        <table class="table">
            <tr>
                <td><@macros.address "Shipping"/></td>
                <td><@macros.address "Billing"/></td>
            </tr>
        </table>
    </div>
    <br/>
    <div class="collapse" id="paymentInfo">
        <p class="h6">Payment Info</p>
        <table class="table">
            <tr>
                <td>
                    <label for="payment_brand">Payment brand:</label>
                </td>
                <td>
                    <select name="paymentBrand" id="payment_brand" class="form-select">
                        <option value="ANY" selected="selected">Any</option>
                        <option value="IDEAL">iDEAL</option>
                        <option value="PAYPAL">PayPal</option>
                        <option value="AFTERPAY">AfterPay</option>
                        <option value="MASTERCARD">Mastercard</option>
                        <option value="VISA">Visa</option>
                        <option value="BANCONTACT">Bancontact</option>
                        <option value="MAESTRO">Maestro</option>
                        <option value="V_PAY">V Pay</option>
                        <option value="SOFORT">Sofort</option>
                        <option value="CARDS">Cards</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="payment_brand_force">Payment brand force:</label>
                </td>
                <td>
                    <select name="paymentBrandForce" id="payment_brand_force" class="form-select">
                        <option value="" selected="selected"></option>
                        <option value="FORCE_ONCE">Force Once</option>
                        <option value="FORCE_ALWAYS">Force Always</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="idealIssuers">Issuer ID:</label>
                </td>
                <td>
                    <select name="issuerId" id="idealIssuers" class="form-select">
                        <option value="" selected="selected"></option>
                        <#if idealIssuers??>
                            <#list idealIssuers as idealIssuer>
                                <option value="${idealIssuer.id}">${idealIssuer.name}</option>
                            </#list>
                        </#if>
                    </select>
                    <input type="submit" name="refreshIssuersId" value="Refresh"
                           formaction="/webshop/refreshIdealIssuers" class="btn btn-secondary"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="initiating_party">initiating Party</label>
                </td>
                <td>
                    <input type="text" name="initiatingParty" id="initiating_party" class="form-control">
                </td>
            </tr>
        </table>
    </div>
    <br/>
    <table class="table">
        <tr>
            <td>
                <label for="skip_hpp_result_page">Skip HPP result page?</label>
            </td>
            <td>
                <input type="checkbox" id="skip_hpp_result_page" name="skipHppResultPage" value="true"
                       class="form-check-input">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="place order" class="btn btn-primary">
            </td>
        </tr>
    </table>
</form>