#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler class handles player input in Unreal Engine
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

	// Movement functions
	void MoveForward(float Value);
	void MoveRight(float Value);

	// Look functions
	void LookUp(float Value);
	void Turn(float Value);

	// Action functions
	void Jump();
	void Fire();

private:
	// Variables to store input values
	float MoveForwardValue;
	float MoveRightValue;
};