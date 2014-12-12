describe "Restaurant", ->

  it "should exist", ->
    expect(Gourmet.Models.Restaurant).toBeDefined()

  describe "Attributes", ->

    ritz = new Gourmet.Models.Restaurant

    it "has a name", ->
      expect(ritz.attributes.name).toBeDefined()

    it "has a postcode", ->
      expect(ritz.attributes.postcode).toBeDefined()

    it "has a rating", ->
      expect(ritz.attributes.rating).toBeDefined()

  describe "Validations", ->

    attrs = {}

    beforeEach ->
      attrs =
        name: 'Ritz'
        postcode: 'N112TP'
        rating: 5

    it "should validate the presence of name", ->
      attrs["name"] = null
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()

    it "should validate the presence of postcode", ->
      attrs["postcode"] = null
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()

    it "should validate the presence of rating", ->
      attrs["rating"] = null
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()

    it "should validate the numericality of rating", ->
      attrs["rating"] = 'foobar'
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()

    it "should not accept a rating < 1", ->
      attrs["rating"] = 0
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()

    it "should not accept a rating > 5", ->
      attrs["rating"] = 6
      ritz = new Gourmet.Models.Restaurant attrs
      expect(ritz.isValid()).toBeFalsy()



describe "Restaurants Collection", ->
  
  restaurants = new Gourmet.Collections.RestaurantsCollection

  it "should exist", ->
    expect(Gourmet.Collections.RestaurantsCollection).toBeDefined()

  it "should use the Restaurant model", ->
    expect(restaurants.model).toEqual Gourmet.Models.Restaurant
