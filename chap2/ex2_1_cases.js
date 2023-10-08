//KWEB-assignment-2023-2R Exercise 2.1

const factorial = (num) => {
    let res = 1;
    for(let i = 1; i<= num; i++){
        res *= (i)
    }
    return res;
}
const permutation = (n, r) => factorial(n) / factorial(n-r);
const combination = (n, r) => factorial(n) / (factorial(n-r) * factorial(r));
const multiPermutation = (n, r) => (n ** r);
const multiCombination = (n, r) => factorial(n+r-1)/(factorial(n-1) * factorial(r));

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination,
}