Extension { #name : #PWBASTGraphicComponent }

{ #category : #'*PWBTestsDataGenerator' }
PWBASTGraphicComponent >> printModifyOn: aMRLDatawindowInstanceGenrator [
	aMRLDatawindowInstanceGenrator
		script:
			(String
				streamContents: [ :stream | 
					stream << aMRLDatawindowInstanceGenrator script.
					stream
						<< aMRLDatawindowInstanceGenrator name;
						<< '.';
						<< 'modify( ';
						nextPut: $';
						<< 'create ';
						<<
							(aMRLDatawindowInstanceGenrator cleanSyntax
								copyFrom: self startPosition
								to: self stopPosition);
						nextPut: $';
						<< ')';
						crlf ])
]
