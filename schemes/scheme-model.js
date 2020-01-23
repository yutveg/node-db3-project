const db = require("../data/dbconfig.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes").select("*");
}

function findById(id) {
  return db("schemes")
    .select("*")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("schemes")
    .join("steps", "steps.scheme_id", "schemes.id")
    .where("schemes.id", id)
    .select("schemes.scheme_name", "steps.step_number", "steps.instructions")
    .orderBy("steps.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(([id]) => {
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes, id)
    .then(res => {
      return findById(id);
    });
}

async function remove(id) {
  const removed = await findById(id);
  return db("schemes")
    .where({ id })
    .del()
    .then(res => {
      return removed;
    });
}

// function remove(id) {
//   return findById(id)
//     .select()
//     .then(res => {
//       if (res === null) return null;
//       else {
//         return db("schemes")
//           .where({ id })
//           .del()
//           .then(result => {
//             return res;
//           });
//       }
//     });
// }
