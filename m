Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B172569E7
	for <lists+cocci@lfdr.de>; Sat, 29 Aug 2020 21:46:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07TJjrKp015434;
	Sat, 29 Aug 2020 21:45:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3058677BF;
	Sat, 29 Aug 2020 21:45:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6219C3F6C
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 21:45:51 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0111.hostedemail.com
 [216.40.44.111])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07TJjnfc021655
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 21:45:50 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id A1C5F1800FB79
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 19:38:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id E46C9181D337B;
 Sat, 29 Aug 2020 19:38:15 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:4321:5007:6120:10004:10400:10848:11232:11658:11914:12114:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: baby09_0a1426127080
X-Filterd-Recvd-Size: 1712
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 29 Aug 2020 19:38:14 +0000 (UTC)
Message-ID: <489164b541e344f254b70429e4f6d467e1602931.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>
Date: Sat, 29 Aug 2020 12:38:13 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008292133360.3629@hadrien>
References: <20200811210127.11889-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2008292133360.3629@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 21:45:53 +0200 (CEST)
X-Greylist: Delayed for 39:33:36 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sat, 29 Aug 2020 21:45:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, cocci@systeme.lip6.fr,
        Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [RFC PATCH] coccinelle: misc: add
	uninitialized_var.cocci script
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

On Sat, 2020-08-29 at 21:36 +0200, Julia Lawall wrote:
> 
> On Wed, 12 Aug 2020, Denis Efremov wrote:
> 
> > Commit 63a0895d960a ("compiler: Remove uninitialized_var() macro") and
> > commit 4b19bec97c88 ("docs: deprecated.rst: Add uninitialized_var()")
> > removed uninitialized_var() and deprecated it.
> > 
> > The purpose of this script is to prevent new occurrences of open-coded
> > variants of uninitialized_var().

> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Signed-off-by: Denis Efremov <efremov@linux.com>
> 
> Applied, without the commented out part.
> 
> I only got three warnings, though.  Perhaps the others have been fixed?

uninitialized_var does not exist in -next


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
