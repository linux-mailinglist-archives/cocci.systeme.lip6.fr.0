Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697783D40E3
	for <lists+cocci@lfdr.de>; Fri, 23 Jul 2021 21:35:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16NJZGV9025085;
	Fri, 23 Jul 2021 21:35:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1A74077F8;
	Fri, 23 Jul 2021 21:35:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3FE633783
 for <cocci@systeme.lip6.fr>; Fri, 23 Jul 2021 21:35:14 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16NJZDcU028460
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 23 Jul 2021 21:35:13 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AiWkPO69LuKcTORzibhduk+DbI+orL9Y04lQ7?=
 =?us-ascii?q?vn2ZKCYlFPBw8vrFoB11726XtN98YgBCpTniAsi9qBHnhPtICOAqVN/IYOCBgg?=
 =?us-ascii?q?uVxepZnO/fKlPbakrDHy1muZuIsZISNDQ9NzdHZA/BjjWFLw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,264,1620684000"; d="scan'208";a="521330012"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 21:35:13 +0200
Date: Fri, 23 Jul 2021 21:35:13 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: =?UTF-8?Q?Andrew_=F0=9F=91=BD__Yourtchenko?= <ayourtch@gmail.com>
In-Reply-To: <CAPi140Ns4Qo1V=MqSUS46oJvO_0jgG5rPFuu0EvNrYw_3LoN0g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2107232131030.2938@hadrien>
References: <CAPi140Mgk8zEk9vStbBU4Hh6oEMU2i6Kaji502AojELjFCR1OA@mail.gmail.com>
 <alpine.DEB.2.22.394.2107222203110.42931@hadrien>
 <CAPi140Ns4Qo1V=MqSUS46oJvO_0jgG5rPFuu0EvNrYw_3LoN0g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 23 Jul 2021 21:35:20 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 23 Jul 2021 21:35:13 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] how to make substitutions at the end of the function,
 vs. the end of each block ?
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

> I missed the fact that the "return ERR" were actually not replaced on
> this example at all,

This is because there are no occurrences of return ERR; in your code.
Probably you expected ERR to be a metavariable, but it's not.  Actually,
fully capitalizing your metavariables is not a good idea.  Coccinelle
expects that fully capitalized things are constants, as in #define ERR -1,
and so when they appear at random places, it doesn't comment about that.
If it had been in lowercase and used as the argument of a return (or as a
function argument, right-hand side of an assignment, etc), Coccinelle
would have printed a warning wondering if you expected it to be a
metavariable.

If ERR is declared as an expression metavariable, then lots of returns are
replaced.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
