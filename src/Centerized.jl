using Statistics

function Centerized(X)
    """
    standardize X by each column
    """
    m, n = size(X)
    for i in 1:n
        X[:,i] .= X[:,i] .- mean(X[:,i])
    end
    return X

end
