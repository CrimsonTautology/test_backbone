// Generated by CoffeeScript 1.8.0
(function() {
  describe("Restaurants View", function() {
    var invisible_table, restaurants_data;
    restaurants_data = [
      {
        id: 0,
        name: 'Ritz',
        postcode: 'N112TP',
        rating: 5
      }, {
        id: 1,
        name: 'Astoria',
        postcode: 'EC1E4R',
        rating: 3
      }, {
        id: 2,
        name: 'Waldorf',
        postcode: 'WE43F2',
        rating: 2
      }
    ];
    invisible_table = document.createElement('table');
    beforeEach(function() {
      this.restaurants_collection = new Gourmet.Collections.RestaurantsCollection(restaurants_data);
      return this.restaurants_view = new Gourmet.View.RestaurantsView({
        collection: this.restaurants_collection,
        el: invisible_table
      });
    });
    it("should be defined", function() {
      return expect(Gourmet.Views.RestaurantsView).toBeDefined();
    });
    it("should have the right element", function() {
      return expect(this.restaurants_view.el).toEqual(invisible_table);
    });
    return it("should have the right collection", function() {
      return expect(this.restaurants_view.collection).toEqual(this.restaurants_collection);
    });
  });

}).call(this);
