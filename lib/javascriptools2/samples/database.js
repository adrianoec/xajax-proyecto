/*
 * This file contains a memory customers database, used by the JavaScripTable examples
 */
 
//Customer class
function Customer(id, name, male, type, income, married, birthDate) {
    this.id = id;
    this.name = name;
    this.gender = male == null ? 'm' : male ? 'm' : 'f';
    this.type = type || 'b';
    this.income = income;
    this.married = married;
    this.birthDate = birthDate;
    
    this.toString = function() {
        return "Customer {id=" + this.id + ", name=" + this.name + ", gender=" + this.gender + ", type=" + this.type + 
            ", income=" + this.income + ", married=" + this.married + ", birthDate=" + this.birthDate + "}";
    }
}

//Customer Type class
function CustomerType(code, description) {
    this.code = code;
    this.description = description;
}

//Customers Array
var customers = new Array();

//Customer types Map
var customerTypes = new Map();
customerTypes.put('b', 'Bronze');
customerTypes.put('s', 'Silver');
customerTypes.put('g', 'Gold');
customerTypes.put('p', 'Platinum');

//Add the Customer data
customers[customers.length] = new Customer(customers.length, 'Michael', true, 'g', 2224.4, false, new Date(1976, 6, 3));
customers[customers.length] = new Customer(customers.length, 'Christopher', true, 'p', 4268.14, true, new Date(1965, 9, 19));
customers[customers.length] = new Customer(customers.length, 'Matthew', true, 'p', 4882.39, true, new Date(1970, 11, 7));
customers[customers.length] = new Customer(customers.length, 'Joshua', true, 'b', 861.41, true, new Date(1979, 0, 13));
customers[customers.length] = new Customer(customers.length, 'Jacob', true, 'b', 540.15, false, new Date(1962, 10, 6));
customers[customers.length] = new Customer(customers.length, 'Andrew', true, 's', 1318.97, false, new Date(1977, 10, 25));
customers[customers.length] = new Customer(customers.length, 'Daniel', true, 'p', 5307.77, false, new Date(1956, 3, 13));
customers[customers.length] = new Customer(customers.length, 'Nicholas', true, 'p', 4170.67, false, new Date(1962, 5, 22));
customers[customers.length] = new Customer(customers.length, 'Tyler', true, 'p', 5479.12, false, new Date(1972, 5, 14));
customers[customers.length] = new Customer(customers.length, 'Joseph', true, 'p', 4938.55, true, new Date(1966, 11, 14));
customers[customers.length] = new Customer(customers.length, 'David', true, 'g', 2749.31, false, new Date(1970, 4, 19));
customers[customers.length] = new Customer(customers.length, 'Brandon', true, 'g', 2337.08, true, new Date(1974, 5, 4));
customers[customers.length] = new Customer(customers.length, 'James', true, 's', 1968.36, false, new Date(1963, 9, 10));
customers[customers.length] = new Customer(customers.length, 'John', true, 'p', 4405.59, false, new Date(1977, 2, 16));
customers[customers.length] = new Customer(customers.length, 'Ryan', true, 'b', 886.6, false, new Date(1953, 2, 15));
customers[customers.length] = new Customer(customers.length, 'Zachary', true, 'g', 2892.69, true, new Date(1959, 5, 22));
customers[customers.length] = new Customer(customers.length, 'Justin', true, 'g', 2088.12, false, new Date(1969, 5, 3));
customers[customers.length] = new Customer(customers.length, 'Anthony', true, 'p', 5472.96, true, new Date(1970, 2, 9));
customers[customers.length] = new Customer(customers.length, 'William', true, 'g', 3367.71, true, new Date(1963, 8, 12));
customers[customers.length] = new Customer(customers.length, 'Robert', true, 'g', 3783.93, false, new Date(1978, 2, 3));
customers[customers.length] = new Customer(customers.length, 'Jonathan', true, 'g', 3211.97, false, new Date(1974, 3, 4));
customers[customers.length] = new Customer(customers.length, 'Kyle', true, 'g', 2627.08, false, new Date(1976, 3, 9));
customers[customers.length] = new Customer(customers.length, 'Austin', true, 'p', 5185.55, true, new Date(1956, 8, 1));
customers[customers.length] = new Customer(customers.length, 'Alexander', true, 'p', 5267.91, false, new Date(1977, 2, 2));
customers[customers.length] = new Customer(customers.length, 'Kevin', true, 'b', 894.58, true, new Date(1976, 8, 23));
customers[customers.length] = new Customer(customers.length, 'Cody', true, 'g', 2616.16, true, new Date(1965, 9, 11));
customers[customers.length] = new Customer(customers.length, 'Thomas', true, 'g', 3658.49, false, new Date(1950, 7, 26));
customers[customers.length] = new Customer(customers.length, 'Jordan', true, 'p', 5173.71, true, new Date(1962, 8, 4));
customers[customers.length] = new Customer(customers.length, 'Eric', true, 'p', 4034.3, true, new Date(1953, 7, 23));
customers[customers.length] = new Customer(customers.length, 'Benjamin', true, 's', 1243.62, true, new Date(1970, 1, 8));
customers[customers.length] = new Customer(customers.length, 'Aaron', true, 'g', 2228.84, true, new Date(1952, 11, 3));

customers[customers.length] = new Customer(customers.length, 'Ashley', false, 'p', 4722.8, false, new Date(1977, 8, 15));
customers[customers.length] = new Customer(customers.length, 'Jessica', false, 'p', 4139.8, false, new Date(1965, 7, 23));
customers[customers.length] = new Customer(customers.length, 'Emily', false, 'p', 5310.64, false, new Date(1955, 0, 11));
customers[customers.length] = new Customer(customers.length, 'Sarah', false, 's', 1078.43, false, new Date(1954, 4, 5));
customers[customers.length] = new Customer(customers.length, 'Samantha', false, 's', 1599.71, false, new Date(1968, 9, 20));
customers[customers.length] = new Customer(customers.length, 'Brittany', false, 'p', 4050.21, false, new Date(1971, 8, 15));
customers[customers.length] = new Customer(customers.length, 'Amanda', false, 's', 1948.33, true, new Date(1977, 2, 12));
customers[customers.length] = new Customer(customers.length, 'Elizabeth', false, 's', 1065.89, true, new Date(1962, 4, 15));
customers[customers.length] = new Customer(customers.length, 'Taylor', false, 'p', 4429.76, true, new Date(1974, 4, 9));
customers[customers.length] = new Customer(customers.length, 'Megan', false, 'p', 4197.65, true, new Date(1971, 11, 7));
customers[customers.length] = new Customer(customers.length, 'Stephanie', false, 'g', 3405.14, true, new Date(1961, 4, 14));
customers[customers.length] = new Customer(customers.length, 'Kayla', false, 's', 1713.36, false, new Date(1967, 3, 5));
customers[customers.length] = new Customer(customers.length, 'Lauren', false, 'g', 3255.59, true, new Date(1958, 2, 1));
customers[customers.length] = new Customer(customers.length, 'Jennifer', false, 's', 1459.02, false, new Date(1958, 0, 23));
customers[customers.length] = new Customer(customers.length, 'Rachel', false, 's', 1649.14, false, new Date(1957, 3, 12));
customers[customers.length] = new Customer(customers.length, 'Hannah', false, 'p', 4913.29, true, new Date(1976, 4, 3));
customers[customers.length] = new Customer(customers.length, 'Nicole', false, 'p', 4007.18, false, new Date(1968, 6, 1));
customers[customers.length] = new Customer(customers.length, 'Amber', false, 's', 1820.56, false, new Date(1958, 2, 19));
customers[customers.length] = new Customer(customers.length, 'Alexis', false, 'g', 3907.39, false, new Date(1972, 8, 6));
customers[customers.length] = new Customer(customers.length, 'Courtney', false, 'g', 3686.59, false, new Date(1974, 3, 5));
customers[customers.length] = new Customer(customers.length, 'Victoria', false, 's', 1332.3, true, new Date(1951, 1, 16));
customers[customers.length] = new Customer(customers.length, 'Danielle', false, 'g', 3474.46, false, new Date(1969, 7, 24));
customers[customers.length] = new Customer(customers.length, 'Alyssa', false, 'g', 2496.16, false, new Date(1971, 3, 1));
customers[customers.length] = new Customer(customers.length, 'Rebecca', false, 'p', 4703.71, true, new Date(1974, 10, 2));
customers[customers.length] = new Customer(customers.length, 'Jasmine', false, 'g', 3495.2, true, new Date(1958, 1, 21));
customers[customers.length] = new Customer(customers.length, 'Katherine', false, 's', 1580.63, true, new Date(1974, 2, 13));
customers[customers.length] = new Customer(customers.length, 'Melissa', false, 'p', 4995.97, true, new Date(1963, 9, 2));
customers[customers.length] = new Customer(customers.length, 'Alexandra', false, 'p', 4378.62, false, new Date(1950, 5, 14));
customers[customers.length] = new Customer(customers.length, 'Brianna', false, 'p', 5360.72, false, new Date(1962, 4, 5));
customers[customers.length] = new Customer(customers.length, 'Chelsea', false, 'p', 4760.33, false, new Date(1965, 11, 10));
customers[customers.length] = new Customer(customers.length, 'Michelle', false, 'g', 3994.23, true, new Date(1950, 6, 5));
