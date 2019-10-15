Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F373D724F
	for <lists+cocci@lfdr.de>; Tue, 15 Oct 2019 11:28:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F9SX2g007334;
	Tue, 15 Oct 2019 11:28:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8614777C3;
	Tue, 15 Oct 2019 11:28:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D607244B2
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 11:28:31 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F9SVeh007586
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 11:28:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,298,1566856800"; d="scan'208";a="406221214"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 11:28:31 +0200
Date: Tue, 15 Oct 2019 11:28:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2ee21d10-db6e-901d-9b47-697ea6a9b877@web.de>
Message-ID: <alpine.DEB.2.21.1910151128220.2818@hadrien>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <56102ab5-b633-7e14-1fd3-3f43fb0770b9@web.de>
 <alpine.DEB.2.21.1910141740580.2330@hadrien>
 <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
 <alpine.DEB.2.21.1910151004110.3774@hadrien>
 <2ee21d10-db6e-901d-9b47-697ea6a9b877@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 11:28:33 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 15 Oct 2019 11:28:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] macro parameters and expressions?
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



On Tue, 15 Oct 2019, Markus Elfring wrote:

> >> BAD:!!!!! #define MACRO(name)    snprintf(pg, PAGE_SIZE, %u\n", ptr->name)
> >
> > If a " is missing then the code can't be parsed and Coccinelle won't do anything.
>
> I suggest to take additional software improvement opportunities into account.
>
> Should a semantic patch language script become able to fix such questionable source code?

No.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
