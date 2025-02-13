// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract Demo {

    struct Todo{
        string name;
        bool isCompleted;
    }

    Todo[] public list;

    // 创建任务
    function create(string memory name_) external returns(uint256) {
        list.push(
            Todo({
                name: name_,
                isCompleted: false
            })
        );
        return list.length;
    }

    // 通过索引 修改任务名称
    function updateName(uint256 index,string memory name) external  {
        list[index].name = name;
    }

     // 通过索引 修改任务名称
    function updateNameTwo(uint256 index,string memory name) external  {
        Todo storage todo = list[index];
        todo.name = name;
    }

    function updateStatus(uint256 index,bool status)external  {
        list[index].isCompleted = status;
    }

     function updateStatusTwo(uint256 index)external  {
        Todo storage todo = list[index];
        todo.isCompleted = !todo.isCompleted;
    }

    // memory 2次拷贝 gas费用更高
    function get(uint256 index) external view returns(string memory name,bool status){
        Todo memory temp = list[index];
        return (temp.name,temp.isCompleted);
    }

    // storage 一次拷贝 gsg费用更低
    function getTwo(uint256 index) external view returns(string memory name,bool status){
        Todo storage temp = list[index];
        return (temp.name,temp.isCompleted);
    }


}