Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02C105675
	for <lists+cocci@lfdr.de>; Thu, 21 Nov 2019 17:05:46 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xALG4u5l017069;
	Thu, 21 Nov 2019 17:04:56 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DB4A777E3;
	Thu, 21 Nov 2019 17:04:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E7D6677CE
 for <cocci@systeme.lip6.fr>; Thu, 21 Nov 2019 17:04:53 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xALG4rYp018287;
 Thu, 21 Nov 2019 17:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574352293;
 bh=t56Li5DKDOosWWHsOWhs49GH0G7LleyXq6+S6pyDdhM=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=W6xJUDXW4HCeLeHgpre6phOLTK9fOF0+RzPAcZR5Ag75rsBapc9tDERpLqhAazaJd
 CuX58Tjsjsx7AFl8ig0qemI79QtQgZXW+sTAsTN4oDVaBgzhquVW6SEv6jtzv8o8NG
 0sIeukkvGGXlIyBNY+ZyQNCBr2Px8QnVhyHo73pg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.172.213]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPHC8-1iTP6a3Brc-004SG0; Thu, 21
 Nov 2019 17:04:52 +0100
References: <alpine.DEB.2.21.1911202134250.2595@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>, Enrico Weigelt <lkml@metux.net>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <86aadac9-15c0-7276-76af-2c30f542ae47@web.de>
Date: Thu, 21 Nov 2019 17:04:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911202134250.2595@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:8L9RnJua62yGTsaOesXzO/9sh2Ho6tE8a48yW9OYUw2pMG4Jufn
 xj0leu4csrZInNhnPrnQhRIbIbBhS7PryDtPLJ9tpeH/Kp1AcIa0SS5qDo0RRg1Eig4f5bD
 VbOdsK0Q/9R+P8pIuYHlXNYZaasAaewTy2klINBIaU3MqGYMuIf4rY5RL3tPZcRHDQwdxp+
 IqnZrQySHbxsgtR1ApuVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eDBYFFp+AUw=:tIZE8i0XIyF2fMl70y3jkM
 DjQpaX0LagYhdjqSSjm5i7ka0dlDYnoyvsJsXahiH7v9sMauUid7StJ22Sy/383BRGWM4rlmg
 94rz+vQ0MaKa0872QlFnfiPN3N00vY8Bf7kAafnRI/wC00IuXBNmq4PsDPq8D5lCTJEGxRKVt
 Y+giRCTo1cqgzddqUTOqAiVJYTq5S/7Lb/RJysMyrQ7wGL4nFLC5fetpwxOsMgmZeg1gR0owu
 N9c0kb9xNiVTbjJzGLy8FZuFVPqrrnz/fKrouRlI0WtInPdjRgU8Z3eR9qfOCOdelYtuMlNdn
 /3qrPInOZpJBaFCYq2gVBN0Q5cC8PyNAGinN30DOds997PNRQC5cwt/61l+y69nFyau9tMj2C
 8BoKVScjuu0icYv30/pNjimq9ppCs+pZAHTN9J5wraGlQnB0A/tA2YVRQSAvbssgNUZy3NT/1
 JKzl4zHidHruNK3rYhBiPBuC/TUmANlaRXHzeDK1ssOcIuNnhlxw7WuAVKyETkSgSxbntsby3
 anjqUma60JHiMFG5U4JsVMgiBaabYWoH3jRP4F6e6jaEB7nfa5VImEjx7/JKFj/UQkrNDWUQc
 fYKhMtQywUwe2Q3t9hALnR7BYnhp7kC9Ghfwo0AwuhCro7oRPjvJpB0K+U+lgLnV7qjglsB/N
 INvrsUTGiP1Uu9ACo7gcvjiAg5UuWkspxMkoLplx2/D0Rik1QNFFb/FF+z8vpL2Mlm/6Sz8Rv
 wlsA4WR5/xfg6cprwdE2ErlZnNMVxbm7wOD3uv+O31s9l/ipLoz9WK8NIifDwkly4P2BOs8b2
 ZvApiqy1iRwJCmsQuKT520/b/VVB/4cZBg3nE37KRTh54Kz7e0eTUXImG+EUhFpto8FFzp6w8
 iTibCczQNYk9UyVNBbN7+KwPEgdKGDUIAt0UhZudnJySvFtFjM22rAxviduvwbwt+Crk5E20P
 s+P/gl6OvQtbQOYiMJ2IejUMDSX9hKJdmloCV6k1DgF7cvdxVOMbURfk2AVMEgEfB9wMix0ah
 nGEZb0ITOQoChPr4XoCJBaXxQuGc37WPKHdqxjl8w++zLhLZ7v6w6Yuni0oK4ub9YzS7y9uIQ
 O/aSdC5mIzKAL9zf5G+EahShmOpF6J+1oaND3+INLrmgqUehCK2Enotz8A63NU2D5wB5+V6Dl
 VNqZuOSB1im3JmjWyHadxICrvS296TinZ46XyOrffpnO7lQvQVeyQEuM8NPZBTeSg3kH07eea
 aBpNHGSz2PUE9/DIn3RqQh82JUqr3zPdufJ3tWTXRtWmG3WJpaGzXMMftCjk=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 21 Nov 2019 17:04:58 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 21 Nov 2019 17:04:53 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] field access scoping / check who accesses certain
 struct members ?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> If you want to check on many types and fields, you can use the following rule:
>
> @@
> identifier virtual.ty;
> struct ty x;
> identifier virtual.fld;
> @@
>
> * x.fld
>
> Then you can run it with the command-line options:
>
> -D ty=type_of_interest -D fld=field_of_interest

This data processing approach can be useful.
But I imagine that an other approach can become nicer if more identifier
combinations should be checked at once.
* How do you think about to construct SmPL constraints for the mentioned
  metavariables in the format of lists or regular expressions?

* Would you like to work with scripted SmPL constraints (so that even more
  helpful data structures can be applied)?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
