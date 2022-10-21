const queryDelete = (id) => `
  delete from "OriginalOrders" oo where oo.id  in (
    ${id}
  );
`;

module.exports = queryDelete