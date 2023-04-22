const Crud = aritfacts.requite('Crud');

contract("Crud", () => {
    let crud = null;
    before( async () => {
        crud = await Crud.deployed();
    });

    it('Should be create a player', async() => {
        await crud.create('Thanh Nghia');
        const player = await crud.read(1);

        assert(player[0].toNumber() == 1);
        assert(player[1] == 'Thanh Nghia');
    });
    

})