module OWHDWallet
  class WalletHECO < WalletAbstract
    def default_fees
      { heco_gas_limit: 21_000, hrc20_gas_limit: 90_000, gas_price: :standard }.freeze
    end

    def coin_type
      'heco'
    end

    def token_name
      'hrc20'
    end

    def eth_like?
      true
    end

    def wallet_gateway_url
      @wallet.fetch(:gateway_url) || default_wallet_gateway_url
    end

    def default_wallet_gateway_url
      if testnet?
        'https://http-testnet.hecochain.com'
      else
        'https://http-mainnet.hecochain.com'
      end
    end

    def testnet?
      @wallet.fetch(:testnet)
    end
  end
end