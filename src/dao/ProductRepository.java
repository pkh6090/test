package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product pro1 = new Product("P001","삼위일체",3733);
		pro1.setDescription("취급주의: 이 아이템만 갖추면 '엄청난 피해(Tons of Damage)'를 줄 수 있죠...");
		pro1.setAbility("공격력 +25, 공격 속도 +40%, 재사용 대기시간 감소 +20%, 이동 속도 +5%, 체력 +250, 마나 +250");
		pro1.setFilename("삼위일체.png");
		
		Product pro2 = new Product("P002","무한의 대검",3400);
		pro2.setDescription("가죽 벗기기에 딱 입니다. 뼈도 깎을수도 있고요.");
		pro2.setAbility("공격력 +80, 치명타 확률 +25%");
		pro2.setFilename("무한의 대검.png");
		
		Product pro3 = new Product("P003","죽음의 무도",3600);
		pro3.setDescription("자세히 보시면 손잡이에 눈알이 박혀있습니다. 기분 나쁘다고요? 걱정마세요. 나는 안그러니까.");
		pro3.setAbility("공격력 +50, 방어력 +30, 마법 저항력 +30, 재사용 대기시간 감소 +10%");
		pro3.setFilename("죽음의 무도.png");
		
		listOfProducts.add(pro1);
		listOfProducts.add(pro2);
		listOfProducts.add(pro3);		
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0;i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {				
				productById = product;
				break;
			}			
		}
		return productById;
	}	
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}
