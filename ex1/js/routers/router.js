// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.app.Workspace = (function(_super) {
    __extends(Workspace, _super);

    function Workspace() {
      return Workspace.__super__.constructor.apply(this, arguments);
    }

    Workspace.prototype.routes = {
      '*filter': 'setFilter'
    };

    Workspace.prototype.setFilter = function(param) {
      if (param) {
        param = param.trim();
      }
      window.app.TodoFilter = param || '';
      return app.Todos.trigger('filter');
    };

    return Workspace;

  })(Backbone.Router);

  window.app.TodoRouter = new window.app.Workspace();

  Backbone.history.start();

}).call(this);
