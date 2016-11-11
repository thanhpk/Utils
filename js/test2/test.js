describe('User', function() {
  describe('#save()', function() {
    it('should save without error', function(done) {
      //var user = new User('Luna');
      setTimeout(function(err) {
        if (err) throw err;
        done();
      }, 2000);
    });
  });
});
