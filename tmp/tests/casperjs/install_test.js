/*
 * CASPERJS TEST(S)
 */

casper.test.comment('Making sure our test site is loaded correctly');

// Make sure the site is up
casper.start('http://localhost:80/', function() {
  this.test.assertHttpStatus(200, 'Testing site is up');

  this.test.assertTitle('Welcome to classic | classic', 'Title seems correct');
});

casper.run(function() {
  this.test.done();
});
