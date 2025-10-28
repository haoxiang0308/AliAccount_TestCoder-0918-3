#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - Handles player input for Unreal Engine games
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	APlayerInputHandler();

	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

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
	// Input mapping context
	UPROPERTY()
	class UInputMappingContext* InputMappingContext;

	// Input action references
	UPROPERTY()
	class UInputAction* MoveForwardAction;

	UPROPERTY()
	class UInputAction* MoveRightAction;

	UPROPERTY()
	class UInputAction* LookUpAction;

	UPROPERTY()
	class UInputAction* TurnAction;

	UPROPERTY()
	class UInputAction* JumpAction;

	UPROPERTY()
	class UInputAction* FireAction;
};