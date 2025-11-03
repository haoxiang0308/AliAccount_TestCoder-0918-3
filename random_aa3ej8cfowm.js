const nameObject = {
  _name: '',

  getName() {
    return this._name;
  },

  setName(name) {
    this._name = name;
  }
};

module.exports = nameObject;