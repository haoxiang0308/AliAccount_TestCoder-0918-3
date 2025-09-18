// WxJqGZHegwyU.h
// Header file for player input handling class in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "WxJqGZHegwyU.generated.h"

UCLASS()
class APlayerInputHandler : public AActor
{
	GENERATED_BODY()
	
public:	
	// Sets default values for this actor's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Setup input bindings
	void SetupInputBindings();

	// Movement functions
	UFUNCTION()
	void MoveForward(float Value);
	
	UFUNCTION()
	void MoveRight(float Value);

	// Camera functions
	UFUNCTION()
	void Turn(float Value);
	
	UFUNCTION()
	void LookUp(float Value);

	// Jump functions
	UFUNCTION()
	void Jump();
	
	UFUNCTION()
	void StopJumping();
};