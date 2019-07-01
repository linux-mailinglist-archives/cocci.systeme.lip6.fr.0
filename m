Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527355217
	for <lists+cocci@lfdr.de>; Tue, 25 Jun 2019 16:38:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5PEcBQR025071;
	Tue, 25 Jun 2019 16:38:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9F9677782;
	Tue, 25 Jun 2019 16:38:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B5C7476AC
 for <cocci@systeme.lip6.fr>; Tue, 25 Jun 2019 16:38:08 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5PEc8mR024865
 for <cocci@systeme.lip6.fr>; Tue, 25 Jun 2019 16:38:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,416,1557180000"; d="scan'208";a="389006630"
Received: from wifi-eduroam-0-109.u-strasbg.fr (HELO hadrien) ([130.79.0.109])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 16:38:05 +0200
Date: Tue, 25 Jun 2019 16:38:05 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <eb86530e-4d1b-c080-fc7c-341d24acb8ef@web.de>
Message-ID: <alpine.DEB.2.21.1906251636360.2556@hadrien>
References: <43dc8f93-4c20-32da-f5c2-6f26bc4ef627@web.de>
 <eb86530e-4d1b-c080-fc7c-341d24acb8ef@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 25 Jun 2019 16:38:14 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 25 Jun 2019 16:38:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] More precise distinction of types for source code
 searches?
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



On Tue, 25 Jun 2019, Markus Elfring wrote:

> > The expected difference can trigger the need to express this detail
> > by the usage of two identifiers based on the same metavariable type.
>
> I guess that this wording should be clarified a bit more according to
> the current software development status around the semantic patch language.
> A selection of different metavariable types is supported already.
> https://github.com/coccinelle/coccinelle/blob/c6d7554edf7c4654aeae4d33c3f040e300682f23/docs/manual/cocci_syntax.tex#L199
>
> So it seems to be occasionally appropriate to use metavariables with
> the same type while different names are chosen then for the corresponding
> variable declaration.
>
>
> Another SmPL script example:
> @test@
> constant c1, c2;
> @@
>  x =
> *    c1
>  ;
>  x =
> *    c2
>  ;

@@
expression x;
constant c1,c2;
@@

x = c1;
(
x = c1;
|
*x = c2;
)

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
