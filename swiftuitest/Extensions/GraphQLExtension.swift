//
//  GraphQLExtension.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/12.
//

import Amplify
import AWSPluginsCore

extension GraphQLRequest
{
    static func getRecipesByProtein(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByProtein($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByProtein(
                type: "Recipe",
                protein: {ge: $protein},
                filter: {state: {eq: $state}, fat: {le: $fat}, carbo:{le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByProtein"
        )
    }
    
    static func getRecipesByFat(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByFat($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByFat(
                type: "Recipe",
                fat: {le: $fat},
                filter: {state: {eq: $state}, protein: {ge: $protein}, carbo:{le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: ASC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByFat"
        )
    }
    
    static func getRecipesByCarbo(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByCarbo($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByCarbo(
                type: "Recipe",
                carbo:{le: $carbo},
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: ASC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByCarbo"
        )
    }
    
    static func getRecipesByFav() -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByFav {
            recipesByFav(
                type: "Recipe",
                limit: 10,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [:],
            responseType: QueryRecipes.self,
            decodePath: "recipesByFav"
        )
    }
    
    static func getRecipesByDate(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByDate($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByDate(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getRecipesByDateNextPage(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByDate($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String,$nextToken:String) {
            recipesByDate(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword,
                "nextToken": nextToken
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getRecipesByProteinOrderedNextPage(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByProtein($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String,$nextToken:String) {
            recipesByProtein(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword,
                "nextToken": nextToken
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByProtein"
        )
    }
    
    static func getRecipesByFatOrderedNextPage(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByFat($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String,$nextToken:String) {
            recipesByFat(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword,
                "nextToken": nextToken
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByFat"
        )
    }
    
    static func getRecipesByCarboOrderedNextPage(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByCarbo($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String,$nextToken:String) {
            recipesByCarbo(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword,
                "nextToken": nextToken
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByCarbo"
        )
    }
    
    static func getFavsByDate(
        userId: String
    ) -> GraphQLRequest<QueryFavs>
    {
        let document = """
        query FavsByDate($userId:String) {
            favsByDate(
                type: "Fav",
                filter: {userID:{eq: $userId}},
                limit: 30,
                sortDirection: DESC
            ) {
                items {
                    id
                    type
                    userID
                    recipeID
                    createdAt
                    updatedAt
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryFavs>(
            document: document,
            variables: [
                "userId": userId,
            ],
            responseType: QueryFavs.self,
            decodePath: "favsByDate"
        )
    }
    
    static func getFavsByDateNextPage(userid:String, nextToken: String = "") -> GraphQLRequest<QueryFavs>
    {
        let document = """
        query FavsByDate($userid:String!, $nextToken:String!) {
            favsByDate(
                type: "Fav",
                filter: {userID: {eq: $userid}},
                limit: 30,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    type
                    userID
                    recipeID
                    createdAt
                    updatedAt
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryFavs>(
            document: document,
            variables: [
                "userid": userid,
                "nextToken": nextToken
            ],
            responseType: QueryFavs.self,
            decodePath: "favsByDate"
        )
    }
    
    static func getMyRecipesByDate(userid:String) -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByDate($userid:String!, $flg:Int!) {
            recipesByDate(
                type: "Recipe",
                filter: {user: {eq: $userid}, delFlg: {eq: $flg}},
                limit: 5,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "userid": userid,
                "flg": 0,
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getMyRecipesByDateNextPage(userid:String, nextToken: String = "") -> GraphQLRequest<QueryRecipes>
    {
        let document = """
        query RecipesByDate($userid:String!, $flg:Int!, $nextToken:String!) {
            recipesByDate(
                type: "Recipe",
                filter: {user: {eq: $userid}, delFlg: {eq: $flg}},
                limit: 5,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    calorie
                    protein
                    fat
                    carbo
                    state
                    materials
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryRecipes>(
            document: document,
            variables: [
                "userid": userid,
                "flg": 0,
                "nextToken": nextToken
            ],
            responseType: QueryRecipes.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getRecipeForDetail(id: String)-> GraphQLRequest<Recipe>
    {
        let document = """
        query MyQuery($id: ID!) {
            getRecipe(id: $id) {
                id
                user
                type
                title
                calorie
                protein
                fat
                carbo
                state
                materials
                reviews {
                    items {
                        user
                        content
                        createdAt
                        id
                        image
                        recipeID
                        updatedAt
                    }
                }
                contents {
                    items {
                        content
                        createdAt
                        id
                        image
                        order
                        recipeID
                        updatedAt
                    }
                }
                favNum
                createdAt
                updatedAt
                delFlg
            }
        }
        """
        return GraphQLRequest<Recipe>(
            document: document,
            variables: [
                "id": id
            ],
            responseType: Recipe.self
            ,decodePath: "getRecipe"
        )
    }
}
