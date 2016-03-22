import Control.Applicative

-- to-do
-- 1. 정보에 라벨링 기능 추가
-- 2. 정보를 모두 받고 원하는 값만 출력하는 기능 추가

main = do
    -- 정보 -> 수 데이터로 가공 -> 처리
    -- read 할때 타입추론을 할 수 있도록 가공과정에서 타입지정 필수
    l_rew <- getContents 
    let l = map (map read . words) (lines l_rew) :: [[Int]]
    mapM (putResult differenceCheck) l
    
putResult :: (Num a, Show a) => (a -> a -> a) -> [a] -> IO () 
putResult f d = putStrLn (unwords (map show r))
            where r = expelZipList $ f <$> ZipList (tail d) <*> ZipList (init d)

differenceCheck :: (Num a) => a -> a -> a
differenceCheck = (-)
    
expelZipList :: ZipList a -> [a]
expelZipList (ZipList xs) = xs

{-
main = do
    l_rew <- getContents
    let l = map (map read . words) (lines l_rew) :: [[Int]]
    select_rew <- getLine
    let select = map read (words select_rew) :: [Int]
    let l_select = map (l !!) select
    mapM (putResult differenceCheck) l_select
    
doing l = do
-}