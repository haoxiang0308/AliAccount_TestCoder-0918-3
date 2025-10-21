#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - Handles player input in Unreal Engine
 */
UCLASS()
class PLAYERINPUT_API APlayerInputHandler : public APlayerController
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

	// Input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);
	void Jump();

private:
	// Movement variables
	float ForwardInputValue;
	float RightInputValue;
};