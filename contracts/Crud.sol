pragma solidity >=0.7.0 <0.9.0;

contract Crud{

    struct Player{ //chua cac du lieu nguoi dung
        uint256 id;
        string name;
    }

    Player[] public player; //luu tru player, mang y nghia 1 kieu du lieu, luu tru duoi dang array

    uint256 public nextId = 1;

    function createPlayer(string memory name) public {
        player.push(Player(nextId, name)); //push vao array
        nextId++; //cong them id moi
    }

    function readPlayer(uint256 id) public view returns (uint256, string memory) {
        uint256 i = loopId(id);
        return (player[i].id, player[i].name);
    }

    function uploadPlayer(uint256 id, string memory _name) public {
        uint256 i = loopId(id);
        player[i].name = _name;
    }

    function deletePlayer(uint256 id) public {
        uint256 i = loopId(id);
        delete(player[i]);
    }

    function loopId(uint256 id) internal view returns (uint256 _id){
        for(uint256 i = 0; i < player.length; i++){
            if(player[i].id == id){
                return i;
            }
        }
        revert("Player does not exist");
    }
}