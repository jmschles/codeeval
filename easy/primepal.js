function isPrime(n) {
  if (n < 2) {
    return false;
  } else if (n === 2) {
    return true;
  } else {
    for (var i = 2; i <= Math.sqrt(n); i++) {
      if (n % i === 0) {
        return false;
      }
    }
  }
  return true;
}

function isPalindrome(str) {
  if (str.length <= 1) {
    return true;
  } else {
    if (str[0] === str.slice(-1)) {
      isPalindrome(str.slice(1,-1));
      return true;
    } else {
      return false;
    }
  }
}

function primePal() {
  var best = 0;
  for (var n = 1; n <= 1000; n++) {
    if (isPrime(n) && isPalindrome(n.toString())) {
      best = n;
    }
  }
  console.log(best);
}

primePal();
