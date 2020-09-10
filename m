Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F0265FD4
	for <lists+cocci@lfdr.de>; Fri, 11 Sep 2020 14:53:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08BCr3OY014704;
	Fri, 11 Sep 2020 14:53:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A5FCD77BF;
	Fri, 11 Sep 2020 14:53:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 375C65F8F
 for <cocci@systeme.lip6.fr>; Fri, 11 Sep 2020 14:53:01 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0030.hostedemail.com
 [216.40.44.30])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08BCr0on006756
 for <cocci@systeme.lip6.fr>; Fri, 11 Sep 2020 14:53:00 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 79C4A18017AB6
 for <cocci@systeme.lip6.fr>; Thu, 10 Sep 2020 21:36:07 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 06D4E100E7B42;
 Thu, 10 Sep 2020 21:36:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:966:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2110:2196:2199:2393:2553:2559:2562:2691:2828:2902:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3873:4321:4385:5007:6119:7903:8531:9040:10004:10400:10450:10455:11232:11658:11914:12296:12297:12740:12760:12895:13069:13071:13311:13357:13439:14096:14097:14180:14181:14659:14721:19904:19999:21060:21080:21433:21451:21627:21939:30012:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: chain07_230dacc270e9
X-Filterd-Recvd-Size: 2027
Received: from XPS-9350 (unknown [172.58.19.160])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Thu, 10 Sep 2020 21:36:02 +0000 (UTC)
Message-ID: <617a44ab25f4ac346f1dbb4174d5fb4f358a8610.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>
Date: Thu, 10 Sep 2020 14:35:59 -0700
In-Reply-To: <202009101250.FBB416D@keescook>
References: <20200811210127.11889-1-efremov@linux.com>
 <20200901094812.428896-1-efremov@linux.com>
 <afc2cffdd315d3e4394af149278df9e8af7f49f4.camel@perches.com>
 <202009101250.FBB416D@keescook>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 11 Sep 2020 14:53:04 +0200 (CEST)
X-Greylist: Delayed for 01:10:00 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Fri, 11 Sep 2020 14:53:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] checkpatch: Warn on self-assignments
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

On Thu, 2020-09-10 at 12:51 -0700, Kees Cook wrote:
> On Sat, Sep 05, 2020 at 10:58:29AM -0700, Joe Perches wrote:
> > The uninitialized_var() macro was removed recently via
> > commit 63a0895d960a ("compiler: Remove uninitialized_var() macro")
> > as it's not a particularly useful warning and its use can
> > "paper over real bugs".
> > 
> > Add a checkpatch test to warn on self-assignments as a means
> > to avoid compiler warnings and as a back-door mechanism to
> > reproduce the old uninitialized_var macro behavior.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> I like it! :)
> 
> Can you add a section to code style and include a link in the checkpatch
> warning to it? (Feel free to just reuse the text removed from
> deprecated.rst)

Hi Kees.

I believe coding style is already a bit bloated
and more rules and content really won't add much
for new developers.

You're welcome to try to add whatever you want
to it though.

cheers, Joe

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
